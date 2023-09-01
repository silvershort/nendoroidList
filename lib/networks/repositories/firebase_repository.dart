import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nendoroid_db/main_new.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_repository.g.dart';

@Riverpod(keepAlive: true)
FirebaseRepository firebaseRepository(FirebaseRepositoryRef ref) {
  return FirebaseRepository();
}

class FirebaseRepository {
  static const String initCollectionName = 'InitData';
  static const String userCollectionName = 'BackupData';
  static const String initDocumentName = 'baseData';

  static const int limitLength = 800000;
  static const int splitCount = 1500;

  CollectionReference _product = FirebaseFirestore.instance.collection(userCollectionName);
  String _documentID = initDocumentName;

  void initUserSetting({required String documentID}) {
    _product = FirebaseFirestore.instance.collection(userCollectionName);
    _documentID = documentID;
  }

  void initDefaultSetting() {
    _product = FirebaseFirestore.instance.collection(initCollectionName);
    _documentID = initDocumentName;
  }

  Future<BackupData> readData() async {
    try {
      BackupData? backupData;
      for (int i = 0; i < 1000; i++) {
        late DocumentSnapshot<Object?> snapshot;
        // 0번째 데이터는 순번이 없음 (기존 데이터 호환)
        if (i == 0) {
          snapshot = await _product.doc(_documentID).get();
        } else {
          snapshot = await _product.doc("${_documentID}_${i + 1}").get();
        }
        if (snapshot.data() == null) {
          break;
        }

        // 첫번째 데이터는 모든 데이터를 저장하고 이후 데이터는 넨도리스트 데이터만 골라서 붙여준다.
        if (i == 0) {
          backupData = BackupData.fromJson(snapshot.data() as Map<String, dynamic>);
        } else {
          final BackupData newBackupData = BackupData.fromJson(snapshot.data() as Map<String, dynamic>);
          backupData = backupData!.copyWith(nendoList: [...backupData.nendoList, ...newBackupData.nendoList]);
        }
      }
      return backupData!;
    } catch (error, stackTrace) {
      logger.e(error.toString());
      logger.e(stackTrace.toString());
      return Future.error(error, stackTrace);
    }
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
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
  static const String initNenDollDocumentName = 'baseDollData';

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

  Future<BackupData?> readData() async {
    BackupData? backupData;
    try {
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
      // 유저 다운로드가 아닌 초기 데이터 다운로드일 경우 넨돌 데이터도 같이 다운로드 시켜준다.
      if (_documentID == initDocumentName) {
        final snapshot = await _product.doc(initNenDollDocumentName).get();
        List<NendoData> nenDollList =
            ((snapshot.data() as Map<String, dynamic>)['nenDollList'] as List<dynamic>).map((e) => NendoData.fromJson(e)).toList();
        backupData = backupData!.copyWith(
          nenDollList: nenDollList,
        );
      }
      return backupData!;
    } catch (error, stackTrace) {
      logger.e(error.toString());
      logger.e(stackTrace.toString());
      // 넨돌 데이터 다운로드만 실패했을 경우
      if (backupData != null) {
        return backupData;
      }
      return Future.error(error, stackTrace);
    }
  }

  Future<void> createDate({required BackupData backupData}) async {
    try {
      // 넨돌 데이터 저장
      await _product.doc(initNenDollDocumentName).set(jsonDecode(jsonEncode({"nenDollList": backupData.nenDollList})));

      final BackupData removeBackupData = backupData.copyWith(nenDollList: []);

      // 데이터길이가 길면 파이어스토어에 저장하지 못함. (리미트는 980000~990000 정도로 추정)
      // 따라서 데이터가 일정량을 초과할경우 넨도리스트 1500개를 기준으로 반갈죽해서 저장해준다.
      final int dataLength = jsonEncode(removeBackupData.toJson()).length;
      if (dataLength > limitLength) {
        final int divideCount = (dataLength ~/ limitLength) + 1;
        for (int i = 0; i < divideCount; i++) {
          late BackupData data;
          if (i == divideCount - 1) {
            data = removeBackupData.copyWith(nendoList: removeBackupData.nendoList.sublist(splitCount * i));
          } else {
            data = removeBackupData.copyWith(nendoList: removeBackupData.nendoList.sublist(splitCount * i, splitCount * (i + 1)));
          }
          // 첫번째 도큐먼트 이름은 숫자를 붙이지 않는다 (기존 데이터 호환문제)
          // 두번째 도큐먼트부터는 뒤쪽에 _${숫자} 를 붙여준다.
          final String documentName = "$_documentID${i == 0 ? "" : "_${i + 1}"}";
          await _product.doc(documentName).set(jsonDecode(jsonEncode(data.toJson())));
        }
      } else {
        await _product.doc(_documentID).set(jsonDecode(jsonEncode(removeBackupData.toJson())));
      }
      return;
    } catch (e) {
      return Future.error("데이터생성에 실패했습니다.\nerror : ${e.toString()}");
    }
  }

  Future<void> updateData({
    required BackupData backupData,
  }) async {
    try {
      await _product.doc(_documentID).update(jsonDecode(jsonEncode(backupData.toJson())));
      return;
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  // 회원 탈퇴시 데이터 삭제
  Future<void> deleteData() async {
    try {
      await _product.doc(_documentID).delete();
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }
}

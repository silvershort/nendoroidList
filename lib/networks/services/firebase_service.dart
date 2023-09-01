import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/networks/repositories/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_service.g.dart';

@Riverpod(keepAlive: true)
FirebaseService firebaseService(FirebaseServiceRef ref) {
  return FirebaseService(repository: ref.watch(firebaseRepositoryProvider));
}

@riverpod
class TestFirebaseService extends _$TestFirebaseService {
  @override
  void build() {
    ref.watch(firebaseRepositoryProvider);
    return;
  }
}

class FirebaseService {
  final FirebaseRepository repository;

  const FirebaseService({
    required this.repository,
  });

  Future<ApiResult<BackupData>> getInitData() async {
    repository.initDefaultSetting();
    try {
      BackupData initData = await repository.readData();
      return ApiResult.success(initData);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<BackupData>> getUserBackupData({required String documentID}) async {
    repository.initUserSetting(documentID: documentID);
    try {
      BackupData initData = await repository.readData();
      return ApiResult.success(initData);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }
}
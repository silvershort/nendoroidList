import 'package:nendoroid_db/feature/_common/model/api_result.dart';
import 'package:nendoroid_db/feature/nendo/data/repository/firebase_repository.dart';
import 'package:nendoroid_db/feature/nendo/model/backup_data.dart';
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

  Future<ApiResult<BackupData>> readInitData() async {
    repository.initDefaultSetting();
    try {
      BackupData? initData = await repository.readData();
      if (initData == null) {
        return const ApiResult.error(ApiError(message: '데이터가 null값입니다.'), StackTrace.empty);
      }
      return ApiResult.success(initData);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<BackupData>> readUserBackupData({required String documentID}) async {
    repository.initUserSetting(documentID: documentID);
    try {
      BackupData? initData = await repository.readData();
      if (initData == null) {
        return const ApiResult.error(ApiError(message: '데이터가 null값입니다.'), StackTrace.empty);
      }
      return ApiResult.success(initData);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<void>> createInitData({required BackupData backupData}) async {
    repository.initDefaultSetting();
    try {
      await repository.createDate(backupData: backupData);
      return const ApiResult.success(null);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<void>> createBackupData({
    required String documentID,
    required BackupData backupData,
  }) async {
    repository.initUserSetting(documentID: documentID);
    try {
      await repository.createDate(backupData: backupData);
      return const ApiResult.success(null);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<void>> updateData({
    required String documentID,
    required BackupData backupData,
  }) async {
    repository.initUserSetting(documentID: documentID);
    try {
      await repository.updateData(backupData: backupData);
      return const ApiResult.success(null);
    } catch (error, stackTrace) {
      return ApiResult.error(const ApiError(message: '데이터백업에 실패했습니다.'), stackTrace);
    }
  }

  Future<ApiResult<void>> deleteData(String documentID) async {
    repository.initUserSetting(documentID: documentID);
    try {
      await repository.deleteData();
      return const ApiResult.success(null);
    } catch (error, stackTrace) {
      return ApiResult.error(const ApiError(message: '데이터삭제에 실패했습니다.'), stackTrace);
    }
  }
}

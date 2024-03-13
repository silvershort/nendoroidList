import 'package:async/async.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/models/doll_type.dart';
import 'package:nendoroid_db/models/nen_doll_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/repo.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/networks/services/firebase_service.dart';
import 'package:nendoroid_db/networks/services/github_service.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_download_provider.g.dart';

/// (구)다운로드 방식
/// 초기 데이터 갱신을 위해서 Github로 다운로드를 진행한 후 업로드를 해줘야 한다.
@Riverpod(keepAlive: true)
class GithubDownload extends _$GithubDownload {
  late final GithubService _githubService;
  List<String> _folderNameList = [];
  List<String> _nameList = [];
  List<String> _setNameList = [];

  List<String> _bodyNameList = [];
  List<String> _clothesNameList = [];
  List<String> _customizingNameList = [];
  List<String> _dollNameList = [];

  final List<SetData> _setList = [];
  final List<NendoData> _nendoList = [];
  final List<NendoData> _nenDollList = [];

  // 폴더목록 필터링을 위한 정규식
  final RegExp _folderReg = RegExp(r"[0-9][-][0-9]");

  @override
  void build() {
    _githubService = ref.watch(githubServiceProvider);
    return;
  }

  Future<void> fetchNendoData() async {
    await fetchFolderNameList();
    for (int i = 0; i < _folderNameList.length; i++) {
      try {
        await fetchJsonNameList(currentIndex: i);
        await fetchNendoList(jsonList: _nameList, currentIndex: i);
      } catch (error, stackTrace) {
        talker.error(error.toString(), error, stackTrace);
      }
    }
    talker.debug('--------------------@@@ 넨도로이드 데이터 다운 완료');
    saveLocalDB();
  }

  Future<void> fetchFolderNameList() async {
    final result = await _githubService.getRepoList(folderName: '');
    result.when(
      success: (value) {
        // 정규식을 통해서 유효한 넨도 폴더명만 남겨둔다 ex) Set폴더 제외
        _folderNameList = value.map((e) => e.name).where((element) => _folderReg.hasMatch(element)).toList();
      },
      error: (error, stackTrace) {
        talker.error(error.toString(), error, stackTrace);
        return Future.error(error, stackTrace);
      },
    );
  }

  Future<void> fetchSetNameList() async {
    final result = await _githubService.getRepoList(folderName: "Set");
    result.when(
      success: (value) {
        _setNameList = value.map((e) => e.name).toList();
      },
      error: (error, stackTrace) {
        talker.error(error.toString(), error, stackTrace);
        return Future.error(error, stackTrace);
      },
    );
  }

  Future<void> fetchJsonNameList({required int currentIndex}) async {
    String number = _folderNameList[currentIndex];
    final result = await _githubService.getRepoList(folderName: number);
    result.when(
      success: (value) {
        _nameList = value.map((e) => e.name).toList();
      },
      error: (error, stackTrace) {
        talker.error(error.toString(), error, stackTrace);
        return Future.error(error, stackTrace);
      },
    );
  }

  Future<void> fetchDollJsonNameList() async {
    try {
      List<Repo> result = await _githubService.getNenDollJsonList(dollType: DollType.body);

      _bodyNameList = result.map((e) => e.name).toList();
      result = await _githubService.getNenDollJsonList(dollType: DollType.clothes);
      _clothesNameList = result.map((e) => e.name).toList();
      result = await _githubService.getNenDollJsonList(dollType: DollType.customizing);
      _customizingNameList = result.map((e) => e.name).toList();
      result = await _githubService.getNenDollJsonList(dollType: DollType.doll);
      _dollNameList = result.map((e) => e.name).toList();
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
    }
  }

  Future<void> fetchSetList({required List<String> nameList}) async {
    _setList.clear();
    int loopCount = nameList.length ~/ 100 + 1;
    for (int j = 0; j < loopCount; j++) {
      FutureGroup<SetData> futureGroup = FutureGroup();
      for (int i = j * 100; i < (j + 1) * 100; i++) {
        if (i == nameList.length) {
          break;
        }
        futureGroup.add(
          _githubService.getSetData(
            folderName: "Set",
            fileName: nameList[i],
          ),
        );
      }
      futureGroup.close();
      final List<SetData> result = await futureGroup.future;
      _setList.addAll(result);
    }
  }

  Future fetchNendoList({required List<String> jsonList, required int currentIndex}) async {
    FutureGroup<NendoData> futureGroup = FutureGroup();
    for (int i = 0; i < jsonList.length; i++) {
      futureGroup.add(_githubService.getNendoData(folderName: _folderNameList[currentIndex], fileName: jsonList[i]));
    }
    futureGroup.close();
    final List<NendoData> result = await futureGroup.future;
    _nendoList.addAll(result);
  }

  Future<List<NendoData>> fetchNendoDollList() async {
    try {
      FutureGroup<NenDollData> futureGroup = FutureGroup();
      for (int i = 0; i < _dollNameList.length; i++) {
        futureGroup.add(_githubService.getNenDollData(dollType: DollType.doll, fileName: _dollNameList[i]));
      }
      for (int i = 0; i < _clothesNameList.length; i++) {
        futureGroup.add(_githubService.getNenDollData(dollType: DollType.clothes, fileName: _clothesNameList[i]));
      }
      for (int i = 0; i < _customizingNameList.length; i++) {
        futureGroup.add(_githubService.getNenDollData(dollType: DollType.customizing, fileName: _customizingNameList[i]));
      }
      for (int i = 0; i < _bodyNameList.length; i++) {
        futureGroup.add(_githubService.getNenDollData(dollType: DollType.body, fileName: _bodyNameList[i]));
      }
      futureGroup.close();
      final List<NenDollData> result = await futureGroup.future;
      _nenDollList.addAll(result.map((e) => NendoData.fromNenDoll(e)));
      return _nenDollList;
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }

  // 입력받은 리스트를 로컬DB에 저장해준다.
  Future<void> saveNendollLocalDB() async {
    final Box nendoBox = ref.read(hiveProvider).nendoBox;

    for (NendoData data in _nenDollList) {
      await nendoBox.put(data.num, data);
    }
  }

  // 입력받은 리스트를 로컬DB에 저장해준다.
  Future<void> saveLocalDB() async {
    talker.debug('--------------------@@@ 로컬데이터 저장 완료');
    final Box nendoBox = ref.read(hiveProvider).nendoBox;

    for (NendoData data in _nendoList) {
      await nendoBox.put(data.num, data);
    }
  }

  // 파이어베이스에 업로드
  Future<void> uploadFirebase() async {
    final nendoList = ref.read(nendoProvider).requireValue.nendoList;
    final nenDollList = ref.read(nendoProvider).requireValue.nenDollList;
    final setList = ref.read(nendoProvider).requireValue.setList;

    final result = await ref.read(firebaseServiceProvider).createInitData(
          backupData: BackupData(
            nendoList: nendoList.where((element) => element.type == null).toList(),
            nenDollList: nendoList.where((element) => element.type != null).toList(),
            setList: setList,
            email: "silvershortdev@gmail.com",
            commitHash: '',
            backupDate: DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
            commitDate: DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
          ),
        );
    result.when(
      success: (value) {
        talker.info('초기데이터 업로드에 성공했습니다.');
        return;
      },
      error: (error, stackTrace) {
        talker.error(error.toString(), error, stackTrace);
        return Future.error(error, stackTrace);
      },
    );
  }
}

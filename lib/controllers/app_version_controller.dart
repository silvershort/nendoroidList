import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionController extends GetxController{
  bool dataInit = false;

  // 원격 앱버전
  String? remoteAppVersion;

  // 로컬 앱버전
  final RxString _appVersion = ''.obs;
  String get appVersion => _appVersion.value;
  final RxString _buildNumber = ''.obs;
  String get buildNumber => _buildNumber.value;

  final RxBool _needUpdate = false.obs;
  bool get needUpdate => _needUpdate.value;
  
  final RxString _updateText = "".obs;
  String get updateText => _updateText.value;
  final RxString _noticeText = "".obs;
  String get noticeText => _noticeText.value;

  late PackageInfo packageInfo;
  late FirebaseRemoteConfig remoteConfig;

  Future<void> fetchData() async {
    packageInfo = await PackageInfo.fromPlatform();
    _appVersion.value = packageInfo.version;
    _buildNumber.value = packageInfo.buildNumber;
    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: const Duration(seconds: 5),
      ),
    ).onError((error, stackTrace) {
      dataInit = false;
      return;
    });
    dataInit = true;
    return;
  }

  Future<bool> checkAppUpdate() async {
    if (!dataInit) {
      await fetchData();
    }

    await remoteConfig.fetchAndActivate();
    if (!kIsWeb && Platform.isAndroid) {
      remoteAppVersion = remoteConfig.getString("aos_version");
    } else if (!kIsWeb && Platform.isIOS) {
      remoteAppVersion = remoteConfig.getString("ios_version");
    }

    // 개행문자 사용을 위해서 \n을 변환해준다
    _updateText.value = remoteConfig.getString("update_text").replaceAll(r'\n', '\n');
    _noticeText.value = remoteConfig.getString("notice_text").replaceAll(r'\n', '\n');

    if (remoteAppVersion == null || remoteAppVersion!.isEmpty || appVersion.isEmpty) {
      return false;
    }

    List<String> localVersionSplit = appVersion.split(".");
    List<String> remoteVersionSplit = remoteAppVersion!.split(".");
    // 마지막 버전숫자가 잘렸을경우
    if (localVersionSplit.length == 2) {
      localVersionSplit.add("0");
    }

    // 버전코드를 앞에서 부터 비교하면서 원격버전이 더 클경우 업데이트 팝업
    for(int i = 0; i < localVersionSplit.length; i++) {
      if (int.parse(localVersionSplit[i]) < int.parse( remoteVersionSplit[i])) {
        _needUpdate.value = true;
        return true;
      } else if (int.parse(localVersionSplit[i]) > int.parse( remoteVersionSplit[i])) {
        // 현재 버전이 리모트 버전보다 더 클경우 바로 리턴
        return false;
      }
    }
    return false;
  }
}
import 'dart:io';
import 'dart:math';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'remote_config_provider.g.dart';

@Riverpod(keepAlive: true)
RemoteConfigManager remoteConfigManager(RemoteConfigManagerRef ref) {
  return RemoteConfigManager();
}

class RemoteConfigManager {
  late final PackageInfo packageInfo;
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 3),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    await _remoteConfig.fetchAndActivate();
    packageInfo = await PackageInfo.fromPlatform();
  }
  
  int getFirestoreVersion() {
    return _remoteConfig.getInt('nendo_data_version');
  }

  void checkNewVersion(BuildContext context) {
    final int localVersion = convertVersion(packageInfo.version);
    late final int remoteVersion;
    late final int forceVersion = convertVersion(_remoteConfig.getString('force_update'));

    if (Platform.isIOS) {
      remoteVersion = convertVersion(_remoteConfig.getString('ios_version'));
    } else {
      remoteVersion = convertVersion(_remoteConfig.getString('aos_version'));
    }

    // 업데이트 유무
    bool update = remoteVersion > localVersion;
    // 강제 업데이트 유무
    bool force = forceVersion > localVersion;

    if (update) {
      showDialog(
        context: context,
        barrierDismissible: !force,
        builder: (context) {
          return CommonDialog(
            title: '업데이트 알림',
            content: force ? '필수 업데이트가 있습니다.' : '새로운 버전이 출시되었습니다.',
            negativeText: force ? null : '닫기',
            positiveText: '업데이트',
            positiveOnClick: () {
              if (Platform.isAndroid || Platform.isIOS) {
                final appId = Platform.isAndroid ? "com.silvershort.nendoroid_db" : "1634111114";
                final url = Uri.parse(Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId");
                launchUrl(url, mode: LaunchMode.platformDefault);
              }
            },
          );
        },
      );
    }
  }

  int convertVersion(String versionRawString) {
    print("@@@ version : ${versionRawString}");
    List<String> versionStrList = List.from(versionRawString.split('.').reversed);
    int totalVersion = 0;

    // 버전을 비교 계산 하기 위해서 왼쪽 부터 1000^(3-n)씩 곱해서 숫자로 만들어 줌
    // ex) 1.2.1 -> 1 * 1000000 + 2 * 1000 + 1 = 1002001
    // ex) 1.2.13 -> 1 * 1000000 + 2 * 1000 + 13 = 1002013
    // ex) 21.12.1 -> 21 * 1000000 + 12 * 1000 + 1 = 21012001
    // ex) 2.42.32 -> 2 * 1000000 + 42 * 1000 + 32 = 2042032
    // 위의 비교 계산을 위해서 각각의 위치에 있는 버전 넘버는 최대 3자리수 (999) 까지만 설정할 수 있다.
    // ex) 123.999.999 가능 /// 1234.1234.1234 불가능
    for (int i = 0; i < versionStrList.length; i++) {
      int versionNum = int.parse(versionStrList[i]);
      if (i == 0) {
        totalVersion += versionNum;
      } else {
        totalVersion += versionNum * pow(1000, i).toInt();
      }
    }
    return totalVersion;
  }
}

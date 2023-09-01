import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 비동기가 필요한 init 작업을 runApp이전에 수행하기 위해서 provider값을 ProviderScope단에서 override 해준다.
final hiveProvider = Provider<HiveManager>((ref) => throw UnimplementedError());

/// Hive 데이터베이스를 사용하기 위한 클래스, await 작업이 필요한 박스 오픈을 앱 시작 후 미리 다 진행해준다.
class HiveManager {
  Box nendoBox;
  Box setBox;
  Box settingBox;
  Box appThemeBox;
  Box subscribeBox;
  Box termsBox;

  HiveManager({
    required this.nendoBox,
    required this.setBox,
    required this.settingBox,
    required this.appThemeBox,
    required this.subscribeBox,
    required this.termsBox,
  });
}
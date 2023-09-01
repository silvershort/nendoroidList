import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/utilities/app_color.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_setting_provider.g.dart';

part 'app_setting_provider.freezed.dart';

@freezed
class AppSettingState with _$AppSettingState {
  const factory AppSettingState({
    required MaterialColor seedColor,
    required Brightness brightness,
  }) = _AppSettingState;
}

/// 테마, 다크모드같은 앱의 전체적인 세팅을 설정해준다.
@riverpod
class AppSetting extends _$AppSetting {
  @override
  AppSettingState build() {
    // 로컬 DB에서 저장된 설정값을 불러온다.
    final Box appThemeBox = ref.watch(hiveProvider).appThemeBox;

    // 저장된 설정값을 적용하고, 없을 시 기본값을 적용한다.
    return AppSettingState(
      seedColor: AppColor.themeColors[appThemeBox.get(HiveName.appColorIndexKey) ?? AppColor.defaultIndex],
      brightness: appThemeBox.get(HiveName.appBrightnessIndexKey) == 1 ? Brightness.dark : Brightness.light,
    );
  }
}

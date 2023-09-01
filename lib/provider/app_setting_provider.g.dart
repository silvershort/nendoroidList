// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appSettingHash() => r'ec2a8f895dcab2e6007ae39c374d420f8b2e940c';

/// 테마, 다크모드같은 앱의 전체적인 세팅을 설정해준다.
///
/// Copied from [AppSetting].
@ProviderFor(AppSetting)
final appSettingProvider =
    AutoDisposeNotifierProvider<AppSetting, AppSettingState>.internal(
  AppSetting.new,
  name: r'appSettingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSetting = AutoDisposeNotifier<AppSettingState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

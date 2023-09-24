// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$githubDownloadHash() => r'c9d8bacbc73c4bc1528fcc5e323df920c5d92755';

/// (구)다운로드 방식
/// 초기 데이터 갱신을 위해서 Github로 다운로드를 진행한 후 업로드를 해줘야 한다.
///
/// Copied from [GithubDownload].
@ProviderFor(GithubDownload)
final githubDownloadProvider = NotifierProvider<GithubDownload, void>.internal(
  GithubDownload.new,
  name: r'githubDownloadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$githubDownloadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GithubDownload = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nendo_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nendoImageHash() => r'b94f74e6dc3191b352301a5edca67d70d870e410';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NendoImage
    extends BuildlessAutoDisposeAsyncNotifier<NendoImageState> {
  late final NendoData nendoData;

  FutureOr<NendoImageState> build(
    NendoData nendoData,
  );
}

/// See also [NendoImage].
@ProviderFor(NendoImage)
const nendoImageProvider = NendoImageFamily();

/// See also [NendoImage].
class NendoImageFamily extends Family<AsyncValue<NendoImageState>> {
  /// See also [NendoImage].
  const NendoImageFamily();

  /// See also [NendoImage].
  NendoImageProvider call(
    NendoData nendoData,
  ) {
    return NendoImageProvider(
      nendoData,
    );
  }

  @override
  NendoImageProvider getProviderOverride(
    covariant NendoImageProvider provider,
  ) {
    return call(
      provider.nendoData,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nendoImageProvider';
}

/// See also [NendoImage].
class NendoImageProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NendoImage, NendoImageState> {
  /// See also [NendoImage].
  NendoImageProvider(
    NendoData nendoData,
  ) : this._internal(
          () => NendoImage()..nendoData = nendoData,
          from: nendoImageProvider,
          name: r'nendoImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nendoImageHash,
          dependencies: NendoImageFamily._dependencies,
          allTransitiveDependencies:
              NendoImageFamily._allTransitiveDependencies,
          nendoData: nendoData,
        );

  NendoImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nendoData,
  }) : super.internal();

  final NendoData nendoData;

  @override
  FutureOr<NendoImageState> runNotifierBuild(
    covariant NendoImage notifier,
  ) {
    return notifier.build(
      nendoData,
    );
  }

  @override
  Override overrideWith(NendoImage Function() create) {
    return ProviderOverride(
      origin: this,
      override: NendoImageProvider._internal(
        () => create()..nendoData = nendoData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nendoData: nendoData,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NendoImage, NendoImageState>
      createElement() {
    return _NendoImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NendoImageProvider && other.nendoData == nendoData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nendoData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NendoImageRef on AutoDisposeAsyncNotifierProviderRef<NendoImageState> {
  /// The parameter `nendoData` of this provider.
  NendoData get nendoData;
}

class _NendoImageProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NendoImage, NendoImageState>
    with NendoImageRef {
  _NendoImageProviderElement(super.provider);

  @override
  NendoData get nendoData => (origin as NendoImageProvider).nendoData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

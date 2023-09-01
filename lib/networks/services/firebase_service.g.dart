// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseServiceHash() => r'd5224aa66391de50ee2eb4913bf45d33bc57c70f';

/// See also [firebaseService].
@ProviderFor(firebaseService)
final firebaseServiceProvider = Provider<FirebaseService>.internal(
  firebaseService,
  name: r'firebaseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseServiceRef = ProviderRef<FirebaseService>;
String _$testFirebaseServiceHash() =>
    r'cd154f04ff689b72eb55645e5f6e780661d6d848';

/// See also [TestFirebaseService].
@ProviderFor(TestFirebaseService)
final testFirebaseServiceProvider =
    AutoDisposeNotifierProvider<TestFirebaseService, void>.internal(
  TestFirebaseService.new,
  name: r'testFirebaseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFirebaseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFirebaseService = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

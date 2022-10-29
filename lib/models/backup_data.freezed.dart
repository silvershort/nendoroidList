// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'backup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BackupData _$BackupDataFromJson(Map<String, dynamic> json) {
  return _BackupData.fromJson(json);
}

/// @nodoc
mixin _$BackupData {
  List<NendoData> get nendoList => throw _privateConstructorUsedError;
  List<SetData> get setList => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get commitHash => throw _privateConstructorUsedError;
  String get commitDate => throw _privateConstructorUsedError;
  String get backupDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackupDataCopyWith<BackupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupDataCopyWith<$Res> {
  factory $BackupDataCopyWith(
          BackupData value, $Res Function(BackupData) then) =
      _$BackupDataCopyWithImpl<$Res>;
  $Res call(
      {List<NendoData> nendoList,
      List<SetData> setList,
      String email,
      String commitHash,
      String commitDate,
      String backupDate});
}

/// @nodoc
class _$BackupDataCopyWithImpl<$Res> implements $BackupDataCopyWith<$Res> {
  _$BackupDataCopyWithImpl(this._value, this._then);

  final BackupData _value;
  // ignore: unused_field
  final $Res Function(BackupData) _then;

  @override
  $Res call({
    Object? nendoList = freezed,
    Object? setList = freezed,
    Object? email = freezed,
    Object? commitHash = freezed,
    Object? commitDate = freezed,
    Object? backupDate = freezed,
  }) {
    return _then(_value.copyWith(
      nendoList: nendoList == freezed
          ? _value.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: setList == freezed
          ? _value.setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      commitHash: commitHash == freezed
          ? _value.commitHash
          : commitHash // ignore: cast_nullable_to_non_nullable
              as String,
      commitDate: commitDate == freezed
          ? _value.commitDate
          : commitDate // ignore: cast_nullable_to_non_nullable
              as String,
      backupDate: backupDate == freezed
          ? _value.backupDate
          : backupDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BackupDataCopyWith<$Res>
    implements $BackupDataCopyWith<$Res> {
  factory _$$_BackupDataCopyWith(
          _$_BackupData value, $Res Function(_$_BackupData) then) =
      __$$_BackupDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<NendoData> nendoList,
      List<SetData> setList,
      String email,
      String commitHash,
      String commitDate,
      String backupDate});
}

/// @nodoc
class __$$_BackupDataCopyWithImpl<$Res> extends _$BackupDataCopyWithImpl<$Res>
    implements _$$_BackupDataCopyWith<$Res> {
  __$$_BackupDataCopyWithImpl(
      _$_BackupData _value, $Res Function(_$_BackupData) _then)
      : super(_value, (v) => _then(v as _$_BackupData));

  @override
  _$_BackupData get _value => super._value as _$_BackupData;

  @override
  $Res call({
    Object? nendoList = freezed,
    Object? setList = freezed,
    Object? email = freezed,
    Object? commitHash = freezed,
    Object? commitDate = freezed,
    Object? backupDate = freezed,
  }) {
    return _then(_$_BackupData(
      nendoList: nendoList == freezed
          ? _value._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: setList == freezed
          ? _value._setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      commitHash: commitHash == freezed
          ? _value.commitHash
          : commitHash // ignore: cast_nullable_to_non_nullable
              as String,
      commitDate: commitDate == freezed
          ? _value.commitDate
          : commitDate // ignore: cast_nullable_to_non_nullable
              as String,
      backupDate: backupDate == freezed
          ? _value.backupDate
          : backupDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BackupData implements _BackupData {
  const _$_BackupData(
      {required final List<NendoData> nendoList,
      required final List<SetData> setList,
      required this.email,
      required this.commitHash,
      required this.commitDate,
      required this.backupDate})
      : _nendoList = nendoList,
        _setList = setList;

  factory _$_BackupData.fromJson(Map<String, dynamic> json) =>
      _$$_BackupDataFromJson(json);

  final List<NendoData> _nendoList;
  @override
  List<NendoData> get nendoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  final List<SetData> _setList;
  @override
  List<SetData> get setList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_setList);
  }

  @override
  final String email;
  @override
  final String commitHash;
  @override
  final String commitDate;
  @override
  final String backupDate;

  @override
  String toString() {
    return 'BackupData(nendoList: $nendoList, setList: $setList, email: $email, commitHash: $commitHash, commitDate: $commitDate, backupDate: $backupDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackupData &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList) &&
            const DeepCollectionEquality().equals(other._setList, _setList) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.commitHash, commitHash) &&
            const DeepCollectionEquality()
                .equals(other.commitDate, commitDate) &&
            const DeepCollectionEquality()
                .equals(other.backupDate, backupDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nendoList),
      const DeepCollectionEquality().hash(_setList),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(commitHash),
      const DeepCollectionEquality().hash(commitDate),
      const DeepCollectionEquality().hash(backupDate));

  @JsonKey(ignore: true)
  @override
  _$$_BackupDataCopyWith<_$_BackupData> get copyWith =>
      __$$_BackupDataCopyWithImpl<_$_BackupData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BackupDataToJson(
      this,
    );
  }
}

abstract class _BackupData implements BackupData {
  const factory _BackupData(
      {required final List<NendoData> nendoList,
      required final List<SetData> setList,
      required final String email,
      required final String commitHash,
      required final String commitDate,
      required final String backupDate}) = _$_BackupData;

  factory _BackupData.fromJson(Map<String, dynamic> json) =
      _$_BackupData.fromJson;

  @override
  List<NendoData> get nendoList;
  @override
  List<SetData> get setList;
  @override
  String get email;
  @override
  String get commitHash;
  @override
  String get commitDate;
  @override
  String get backupDate;
  @override
  @JsonKey(ignore: true)
  _$$_BackupDataCopyWith<_$_BackupData> get copyWith =>
      throw _privateConstructorUsedError;
}

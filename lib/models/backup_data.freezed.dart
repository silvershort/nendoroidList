// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  List<NendoData> get nenDollList => throw _privateConstructorUsedError;
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
      _$BackupDataCopyWithImpl<$Res, BackupData>;
  @useResult
  $Res call(
      {List<NendoData> nendoList,
      List<NendoData> nenDollList,
      List<SetData> setList,
      String email,
      String commitHash,
      String commitDate,
      String backupDate});
}

/// @nodoc
class _$BackupDataCopyWithImpl<$Res, $Val extends BackupData>
    implements $BackupDataCopyWith<$Res> {
  _$BackupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? setList = null,
    Object? email = null,
    Object? commitHash = null,
    Object? commitDate = null,
    Object? backupDate = null,
  }) {
    return _then(_value.copyWith(
      nendoList: null == nendoList
          ? _value.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _value.nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _value.setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      commitHash: null == commitHash
          ? _value.commitHash
          : commitHash // ignore: cast_nullable_to_non_nullable
              as String,
      commitDate: null == commitDate
          ? _value.commitDate
          : commitDate // ignore: cast_nullable_to_non_nullable
              as String,
      backupDate: null == backupDate
          ? _value.backupDate
          : backupDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BackupDataCopyWith<$Res>
    implements $BackupDataCopyWith<$Res> {
  factory _$$_BackupDataCopyWith(
          _$_BackupData value, $Res Function(_$_BackupData) then) =
      __$$_BackupDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NendoData> nendoList,
      List<NendoData> nenDollList,
      List<SetData> setList,
      String email,
      String commitHash,
      String commitDate,
      String backupDate});
}

/// @nodoc
class __$$_BackupDataCopyWithImpl<$Res>
    extends _$BackupDataCopyWithImpl<$Res, _$_BackupData>
    implements _$$_BackupDataCopyWith<$Res> {
  __$$_BackupDataCopyWithImpl(
      _$_BackupData _value, $Res Function(_$_BackupData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? setList = null,
    Object? email = null,
    Object? commitHash = null,
    Object? commitDate = null,
    Object? backupDate = null,
  }) {
    return _then(_$_BackupData(
      nendoList: null == nendoList
          ? _value._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _value._nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _value._setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      commitHash: null == commitHash
          ? _value.commitHash
          : commitHash // ignore: cast_nullable_to_non_nullable
              as String,
      commitDate: null == commitDate
          ? _value.commitDate
          : commitDate // ignore: cast_nullable_to_non_nullable
              as String,
      backupDate: null == backupDate
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
      final List<NendoData> nenDollList = const [],
      required final List<SetData> setList,
      required this.email,
      required this.commitHash,
      required this.commitDate,
      required this.backupDate})
      : _nendoList = nendoList,
        _nenDollList = nenDollList,
        _setList = setList;

  factory _$_BackupData.fromJson(Map<String, dynamic> json) =>
      _$$_BackupDataFromJson(json);

  final List<NendoData> _nendoList;
  @override
  List<NendoData> get nendoList {
    if (_nendoList is EqualUnmodifiableListView) return _nendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  final List<NendoData> _nenDollList;
  @override
  @JsonKey()
  List<NendoData> get nenDollList {
    if (_nenDollList is EqualUnmodifiableListView) return _nenDollList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nenDollList);
  }

  final List<SetData> _setList;
  @override
  List<SetData> get setList {
    if (_setList is EqualUnmodifiableListView) return _setList;
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
    return 'BackupData(nendoList: $nendoList, nenDollList: $nenDollList, setList: $setList, email: $email, commitHash: $commitHash, commitDate: $commitDate, backupDate: $backupDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackupData &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList) &&
            const DeepCollectionEquality()
                .equals(other._nenDollList, _nenDollList) &&
            const DeepCollectionEquality().equals(other._setList, _setList) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.commitHash, commitHash) ||
                other.commitHash == commitHash) &&
            (identical(other.commitDate, commitDate) ||
                other.commitDate == commitDate) &&
            (identical(other.backupDate, backupDate) ||
                other.backupDate == backupDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nendoList),
      const DeepCollectionEquality().hash(_nenDollList),
      const DeepCollectionEquality().hash(_setList),
      email,
      commitHash,
      commitDate,
      backupDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final List<NendoData> nenDollList,
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
  List<NendoData> get nenDollList;
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

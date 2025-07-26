// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupData {
  List<NendoData> get nendoList;
  List<NendoData> get nenDollList;
  List<SetData> get setList;
  String get email;
  String get commitHash;
  String get commitDate;
  String get backupDate;

  /// Create a copy of BackupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackupDataCopyWith<BackupData> get copyWith =>
      _$BackupDataCopyWithImpl<BackupData>(this as BackupData, _$identity);

  /// Serializes this BackupData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupData &&
            const DeepCollectionEquality().equals(other.nendoList, nendoList) &&
            const DeepCollectionEquality()
                .equals(other.nenDollList, nenDollList) &&
            const DeepCollectionEquality().equals(other.setList, setList) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.commitHash, commitHash) ||
                other.commitHash == commitHash) &&
            (identical(other.commitDate, commitDate) ||
                other.commitDate == commitDate) &&
            (identical(other.backupDate, backupDate) ||
                other.backupDate == backupDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nendoList),
      const DeepCollectionEquality().hash(nenDollList),
      const DeepCollectionEquality().hash(setList),
      email,
      commitHash,
      commitDate,
      backupDate);

  @override
  String toString() {
    return 'BackupData(nendoList: $nendoList, nenDollList: $nenDollList, setList: $setList, email: $email, commitHash: $commitHash, commitDate: $commitDate, backupDate: $backupDate)';
  }
}

/// @nodoc
abstract mixin class $BackupDataCopyWith<$Res> {
  factory $BackupDataCopyWith(
          BackupData value, $Res Function(BackupData) _then) =
      _$BackupDataCopyWithImpl;
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
class _$BackupDataCopyWithImpl<$Res> implements $BackupDataCopyWith<$Res> {
  _$BackupDataCopyWithImpl(this._self, this._then);

  final BackupData _self;
  final $Res Function(BackupData) _then;

  /// Create a copy of BackupData
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      nendoList: null == nendoList
          ? _self.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _self.nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _self.setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      commitHash: null == commitHash
          ? _self.commitHash
          : commitHash // ignore: cast_nullable_to_non_nullable
              as String,
      commitDate: null == commitDate
          ? _self.commitDate
          : commitDate // ignore: cast_nullable_to_non_nullable
              as String,
      backupDate: null == backupDate
          ? _self.backupDate
          : backupDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BackupData].
extension BackupDataPatterns on BackupData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BackupData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BackupData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BackupData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BackupData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<NendoData> nendoList,
            List<NendoData> nenDollList,
            List<SetData> setList,
            String email,
            String commitHash,
            String commitDate,
            String backupDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BackupData() when $default != null:
        return $default(_that.nendoList, _that.nenDollList, _that.setList,
            _that.email, _that.commitHash, _that.commitDate, _that.backupDate);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<NendoData> nendoList,
            List<NendoData> nenDollList,
            List<SetData> setList,
            String email,
            String commitHash,
            String commitDate,
            String backupDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupData():
        return $default(_that.nendoList, _that.nenDollList, _that.setList,
            _that.email, _that.commitHash, _that.commitDate, _that.backupDate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<NendoData> nendoList,
            List<NendoData> nenDollList,
            List<SetData> setList,
            String email,
            String commitHash,
            String commitDate,
            String backupDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupData() when $default != null:
        return $default(_that.nendoList, _that.nenDollList, _that.setList,
            _that.email, _that.commitHash, _that.commitDate, _that.backupDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BackupData implements BackupData {
  const _BackupData(
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
  factory _BackupData.fromJson(Map<String, dynamic> json) =>
      _$BackupDataFromJson(json);

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

  /// Create a copy of BackupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BackupDataCopyWith<_BackupData> get copyWith =>
      __$BackupDataCopyWithImpl<_BackupData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BackupDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BackupData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'BackupData(nendoList: $nendoList, nenDollList: $nenDollList, setList: $setList, email: $email, commitHash: $commitHash, commitDate: $commitDate, backupDate: $backupDate)';
  }
}

/// @nodoc
abstract mixin class _$BackupDataCopyWith<$Res>
    implements $BackupDataCopyWith<$Res> {
  factory _$BackupDataCopyWith(
          _BackupData value, $Res Function(_BackupData) _then) =
      __$BackupDataCopyWithImpl;
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
class __$BackupDataCopyWithImpl<$Res> implements _$BackupDataCopyWith<$Res> {
  __$BackupDataCopyWithImpl(this._self, this._then);

  final _BackupData _self;
  final $Res Function(_BackupData) _then;

  /// Create a copy of BackupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? setList = null,
    Object? email = null,
    Object? commitHash = null,
    Object? commitDate = null,
    Object? backupDate = null,
  }) {
    return _then(_BackupData(
      nendoList: null == nendoList
          ? _self._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _self._nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _self._setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      commitHash: null == commitHash
          ? _self.commitHash
          : commitHash // ignore: cast_nullable_to_non_nullable
              as String,
      commitDate: null == commitDate
          ? _self.commitDate
          : commitDate // ignore: cast_nullable_to_non_nullable
              as String,
      backupDate: null == backupDate
          ? _self.backupDate
          : backupDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

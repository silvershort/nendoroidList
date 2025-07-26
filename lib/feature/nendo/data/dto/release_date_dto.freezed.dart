// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_date_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReleaseDateDto {
  @JsonKey(name: 'nendo_num')
  String get nendoNum;
  @JsonKey(name: 'release_date')
  String get releaseDate;

  /// Create a copy of ReleaseDateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReleaseDateDtoCopyWith<ReleaseDateDto> get copyWith =>
      _$ReleaseDateDtoCopyWithImpl<ReleaseDateDto>(
          this as ReleaseDateDto, _$identity);

  /// Serializes this ReleaseDateDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReleaseDateDto &&
            (identical(other.nendoNum, nendoNum) ||
                other.nendoNum == nendoNum) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nendoNum, releaseDate);

  @override
  String toString() {
    return 'ReleaseDateDto(nendoNum: $nendoNum, releaseDate: $releaseDate)';
  }
}

/// @nodoc
abstract mixin class $ReleaseDateDtoCopyWith<$Res> {
  factory $ReleaseDateDtoCopyWith(
          ReleaseDateDto value, $Res Function(ReleaseDateDto) _then) =
      _$ReleaseDateDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'nendo_num') String nendoNum,
      @JsonKey(name: 'release_date') String releaseDate});
}

/// @nodoc
class _$ReleaseDateDtoCopyWithImpl<$Res>
    implements $ReleaseDateDtoCopyWith<$Res> {
  _$ReleaseDateDtoCopyWithImpl(this._self, this._then);

  final ReleaseDateDto _self;
  final $Res Function(ReleaseDateDto) _then;

  /// Create a copy of ReleaseDateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nendoNum = null,
    Object? releaseDate = null,
  }) {
    return _then(_self.copyWith(
      nendoNum: null == nendoNum
          ? _self.nendoNum
          : nendoNum // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _self.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReleaseDateDto].
extension ReleaseDateDtoPatterns on ReleaseDateDto {
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
    TResult Function(_ReleaseDateDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReleaseDateDto() when $default != null:
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
    TResult Function(_ReleaseDateDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseDateDto():
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
    TResult? Function(_ReleaseDateDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseDateDto() when $default != null:
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
    TResult Function(@JsonKey(name: 'nendo_num') String nendoNum,
            @JsonKey(name: 'release_date') String releaseDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReleaseDateDto() when $default != null:
        return $default(_that.nendoNum, _that.releaseDate);
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
    TResult Function(@JsonKey(name: 'nendo_num') String nendoNum,
            @JsonKey(name: 'release_date') String releaseDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseDateDto():
        return $default(_that.nendoNum, _that.releaseDate);
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
    TResult? Function(@JsonKey(name: 'nendo_num') String nendoNum,
            @JsonKey(name: 'release_date') String releaseDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseDateDto() when $default != null:
        return $default(_that.nendoNum, _that.releaseDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReleaseDateDto implements ReleaseDateDto {
  const _ReleaseDateDto(
      {@JsonKey(name: 'nendo_num') required this.nendoNum,
      @JsonKey(name: 'release_date') required this.releaseDate});
  factory _ReleaseDateDto.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateDtoFromJson(json);

  @override
  @JsonKey(name: 'nendo_num')
  final String nendoNum;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;

  /// Create a copy of ReleaseDateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReleaseDateDtoCopyWith<_ReleaseDateDto> get copyWith =>
      __$ReleaseDateDtoCopyWithImpl<_ReleaseDateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReleaseDateDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReleaseDateDto &&
            (identical(other.nendoNum, nendoNum) ||
                other.nendoNum == nendoNum) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nendoNum, releaseDate);

  @override
  String toString() {
    return 'ReleaseDateDto(nendoNum: $nendoNum, releaseDate: $releaseDate)';
  }
}

/// @nodoc
abstract mixin class _$ReleaseDateDtoCopyWith<$Res>
    implements $ReleaseDateDtoCopyWith<$Res> {
  factory _$ReleaseDateDtoCopyWith(
          _ReleaseDateDto value, $Res Function(_ReleaseDateDto) _then) =
      __$ReleaseDateDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nendo_num') String nendoNum,
      @JsonKey(name: 'release_date') String releaseDate});
}

/// @nodoc
class __$ReleaseDateDtoCopyWithImpl<$Res>
    implements _$ReleaseDateDtoCopyWith<$Res> {
  __$ReleaseDateDtoCopyWithImpl(this._self, this._then);

  final _ReleaseDateDto _self;
  final $Res Function(_ReleaseDateDto) _then;

  /// Create a copy of ReleaseDateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nendoNum = null,
    Object? releaseDate = null,
  }) {
    return _then(_ReleaseDateDto(
      nendoNum: null == nendoNum
          ? _self.nendoNum
          : nendoNum // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _self.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NendoDto {
  String get num;
  @JsonKey(name: 'gsc_product_num')
  int get gscProductNum;
  int get price;
  String get image;
  String? get gender;
  String? get nameKo;
  String? get nameJa;
  String? get nameEn;
  String? get seriesKo;
  String? get seriesJa;
  String? get seriesEn;

  /// Create a copy of NendoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoDtoCopyWith<NendoDto> get copyWith =>
      _$NendoDtoCopyWithImpl<NendoDto>(this as NendoDto, _$identity);

  /// Serializes this NendoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoDto &&
            (identical(other.num, num) || other.num == num) &&
            (identical(other.gscProductNum, gscProductNum) ||
                other.gscProductNum == gscProductNum) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nameKo, nameKo) || other.nameKo == nameKo) &&
            (identical(other.nameJa, nameJa) || other.nameJa == nameJa) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.seriesKo, seriesKo) ||
                other.seriesKo == seriesKo) &&
            (identical(other.seriesJa, seriesJa) ||
                other.seriesJa == seriesJa) &&
            (identical(other.seriesEn, seriesEn) ||
                other.seriesEn == seriesEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, num, gscProductNum, price, image,
      gender, nameKo, nameJa, nameEn, seriesKo, seriesJa, seriesEn);

  @override
  String toString() {
    return 'NendoDto(num: $num, gscProductNum: $gscProductNum, price: $price, image: $image, gender: $gender, nameKo: $nameKo, nameJa: $nameJa, nameEn: $nameEn, seriesKo: $seriesKo, seriesJa: $seriesJa, seriesEn: $seriesEn)';
  }
}

/// @nodoc
abstract mixin class $NendoDtoCopyWith<$Res> {
  factory $NendoDtoCopyWith(NendoDto value, $Res Function(NendoDto) _then) =
      _$NendoDtoCopyWithImpl;
  @useResult
  $Res call(
      {String num,
      @JsonKey(name: 'gsc_product_num') int gscProductNum,
      int price,
      String image,
      String? gender,
      String? nameKo,
      String? nameJa,
      String? nameEn,
      String? seriesKo,
      String? seriesJa,
      String? seriesEn});
}

/// @nodoc
class _$NendoDtoCopyWithImpl<$Res> implements $NendoDtoCopyWith<$Res> {
  _$NendoDtoCopyWithImpl(this._self, this._then);

  final NendoDto _self;
  final $Res Function(NendoDto) _then;

  /// Create a copy of NendoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? num = null,
    Object? gscProductNum = null,
    Object? price = null,
    Object? image = null,
    Object? gender = freezed,
    Object? nameKo = freezed,
    Object? nameJa = freezed,
    Object? nameEn = freezed,
    Object? seriesKo = freezed,
    Object? seriesJa = freezed,
    Object? seriesEn = freezed,
  }) {
    return _then(_self.copyWith(
      num: null == num
          ? _self.num
          : num // ignore: cast_nullable_to_non_nullable
              as String,
      gscProductNum: null == gscProductNum
          ? _self.gscProductNum
          : gscProductNum // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKo: freezed == nameKo
          ? _self.nameKo
          : nameKo // ignore: cast_nullable_to_non_nullable
              as String?,
      nameJa: freezed == nameJa
          ? _self.nameJa
          : nameJa // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _self.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      seriesKo: freezed == seriesKo
          ? _self.seriesKo
          : seriesKo // ignore: cast_nullable_to_non_nullable
              as String?,
      seriesJa: freezed == seriesJa
          ? _self.seriesJa
          : seriesJa // ignore: cast_nullable_to_non_nullable
              as String?,
      seriesEn: freezed == seriesEn
          ? _self.seriesEn
          : seriesEn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NendoDto].
extension NendoDtoPatterns on NendoDto {
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
    TResult Function(_NendoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoDto() when $default != null:
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
    TResult Function(_NendoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoDto():
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
    TResult? Function(_NendoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoDto() when $default != null:
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
            String num,
            @JsonKey(name: 'gsc_product_num') int gscProductNum,
            int price,
            String image,
            String? gender,
            String? nameKo,
            String? nameJa,
            String? nameEn,
            String? seriesKo,
            String? seriesJa,
            String? seriesEn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoDto() when $default != null:
        return $default(
            _that.num,
            _that.gscProductNum,
            _that.price,
            _that.image,
            _that.gender,
            _that.nameKo,
            _that.nameJa,
            _that.nameEn,
            _that.seriesKo,
            _that.seriesJa,
            _that.seriesEn);
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
            String num,
            @JsonKey(name: 'gsc_product_num') int gscProductNum,
            int price,
            String image,
            String? gender,
            String? nameKo,
            String? nameJa,
            String? nameEn,
            String? seriesKo,
            String? seriesJa,
            String? seriesEn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoDto():
        return $default(
            _that.num,
            _that.gscProductNum,
            _that.price,
            _that.image,
            _that.gender,
            _that.nameKo,
            _that.nameJa,
            _that.nameEn,
            _that.seriesKo,
            _that.seriesJa,
            _that.seriesEn);
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
            String num,
            @JsonKey(name: 'gsc_product_num') int gscProductNum,
            int price,
            String image,
            String? gender,
            String? nameKo,
            String? nameJa,
            String? nameEn,
            String? seriesKo,
            String? seriesJa,
            String? seriesEn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoDto() when $default != null:
        return $default(
            _that.num,
            _that.gscProductNum,
            _that.price,
            _that.image,
            _that.gender,
            _that.nameKo,
            _that.nameJa,
            _that.nameEn,
            _that.seriesKo,
            _that.seriesJa,
            _that.seriesEn);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NendoDto implements NendoDto {
  const _NendoDto(
      {required this.num,
      @JsonKey(name: 'gsc_product_num') required this.gscProductNum,
      required this.price,
      required this.image,
      this.gender,
      this.nameKo,
      this.nameJa,
      this.nameEn,
      this.seriesKo,
      this.seriesJa,
      this.seriesEn});
  factory _NendoDto.fromJson(Map<String, dynamic> json) =>
      _$NendoDtoFromJson(json);

  @override
  final String num;
  @override
  @JsonKey(name: 'gsc_product_num')
  final int gscProductNum;
  @override
  final int price;
  @override
  final String image;
  @override
  final String? gender;
  @override
  final String? nameKo;
  @override
  final String? nameJa;
  @override
  final String? nameEn;
  @override
  final String? seriesKo;
  @override
  final String? seriesJa;
  @override
  final String? seriesEn;

  /// Create a copy of NendoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoDtoCopyWith<_NendoDto> get copyWith =>
      __$NendoDtoCopyWithImpl<_NendoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NendoDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoDto &&
            (identical(other.num, num) || other.num == num) &&
            (identical(other.gscProductNum, gscProductNum) ||
                other.gscProductNum == gscProductNum) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nameKo, nameKo) || other.nameKo == nameKo) &&
            (identical(other.nameJa, nameJa) || other.nameJa == nameJa) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.seriesKo, seriesKo) ||
                other.seriesKo == seriesKo) &&
            (identical(other.seriesJa, seriesJa) ||
                other.seriesJa == seriesJa) &&
            (identical(other.seriesEn, seriesEn) ||
                other.seriesEn == seriesEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, num, gscProductNum, price, image,
      gender, nameKo, nameJa, nameEn, seriesKo, seriesJa, seriesEn);

  @override
  String toString() {
    return 'NendoDto(num: $num, gscProductNum: $gscProductNum, price: $price, image: $image, gender: $gender, nameKo: $nameKo, nameJa: $nameJa, nameEn: $nameEn, seriesKo: $seriesKo, seriesJa: $seriesJa, seriesEn: $seriesEn)';
  }
}

/// @nodoc
abstract mixin class _$NendoDtoCopyWith<$Res>
    implements $NendoDtoCopyWith<$Res> {
  factory _$NendoDtoCopyWith(_NendoDto value, $Res Function(_NendoDto) _then) =
      __$NendoDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String num,
      @JsonKey(name: 'gsc_product_num') int gscProductNum,
      int price,
      String image,
      String? gender,
      String? nameKo,
      String? nameJa,
      String? nameEn,
      String? seriesKo,
      String? seriesJa,
      String? seriesEn});
}

/// @nodoc
class __$NendoDtoCopyWithImpl<$Res> implements _$NendoDtoCopyWith<$Res> {
  __$NendoDtoCopyWithImpl(this._self, this._then);

  final _NendoDto _self;
  final $Res Function(_NendoDto) _then;

  /// Create a copy of NendoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? num = null,
    Object? gscProductNum = null,
    Object? price = null,
    Object? image = null,
    Object? gender = freezed,
    Object? nameKo = freezed,
    Object? nameJa = freezed,
    Object? nameEn = freezed,
    Object? seriesKo = freezed,
    Object? seriesJa = freezed,
    Object? seriesEn = freezed,
  }) {
    return _then(_NendoDto(
      num: null == num
          ? _self.num
          : num // ignore: cast_nullable_to_non_nullable
              as String,
      gscProductNum: null == gscProductNum
          ? _self.gscProductNum
          : gscProductNum // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKo: freezed == nameKo
          ? _self.nameKo
          : nameKo // ignore: cast_nullable_to_non_nullable
              as String?,
      nameJa: freezed == nameJa
          ? _self.nameJa
          : nameJa // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _self.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      seriesKo: freezed == seriesKo
          ? _self.seriesKo
          : seriesKo // ignore: cast_nullable_to_non_nullable
              as String?,
      seriesJa: freezed == seriesJa
          ? _self.seriesJa
          : seriesJa // ignore: cast_nullable_to_non_nullable
              as String?,
      seriesEn: freezed == seriesEn
          ? _self.seriesEn
          : seriesEn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

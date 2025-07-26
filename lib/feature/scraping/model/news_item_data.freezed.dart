// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsItemData {
  String? get number;
  String get name;
  String? get price;
  String get imagePath;
  String get link;
  bool get soldOut;

  /// Create a copy of NewsItemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsItemDataCopyWith<NewsItemData> get copyWith =>
      _$NewsItemDataCopyWithImpl<NewsItemData>(
          this as NewsItemData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsItemData &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.soldOut, soldOut) || other.soldOut == soldOut));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, name, price, imagePath, link, soldOut);

  @override
  String toString() {
    return 'NewsItemData(number: $number, name: $name, price: $price, imagePath: $imagePath, link: $link, soldOut: $soldOut)';
  }
}

/// @nodoc
abstract mixin class $NewsItemDataCopyWith<$Res> {
  factory $NewsItemDataCopyWith(
          NewsItemData value, $Res Function(NewsItemData) _then) =
      _$NewsItemDataCopyWithImpl;
  @useResult
  $Res call(
      {String? number,
      String name,
      String? price,
      String imagePath,
      String link,
      bool soldOut});
}

/// @nodoc
class _$NewsItemDataCopyWithImpl<$Res> implements $NewsItemDataCopyWith<$Res> {
  _$NewsItemDataCopyWithImpl(this._self, this._then);

  final NewsItemData _self;
  final $Res Function(NewsItemData) _then;

  /// Create a copy of NewsItemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? name = null,
    Object? price = freezed,
    Object? imagePath = null,
    Object? link = null,
    Object? soldOut = null,
  }) {
    return _then(_self.copyWith(
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      soldOut: null == soldOut
          ? _self.soldOut
          : soldOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewsItemData].
extension NewsItemDataPatterns on NewsItemData {
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
    TResult Function(_NewsItemData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsItemData() when $default != null:
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
    TResult Function(_NewsItemData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItemData():
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
    TResult? Function(_NewsItemData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItemData() when $default != null:
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
    TResult Function(String? number, String name, String? price,
            String imagePath, String link, bool soldOut)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsItemData() when $default != null:
        return $default(_that.number, _that.name, _that.price, _that.imagePath,
            _that.link, _that.soldOut);
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
    TResult Function(String? number, String name, String? price,
            String imagePath, String link, bool soldOut)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItemData():
        return $default(_that.number, _that.name, _that.price, _that.imagePath,
            _that.link, _that.soldOut);
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
    TResult? Function(String? number, String name, String? price,
            String imagePath, String link, bool soldOut)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItemData() when $default != null:
        return $default(_that.number, _that.name, _that.price, _that.imagePath,
            _that.link, _that.soldOut);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewsItemData implements NewsItemData {
  const _NewsItemData(
      {this.number,
      required this.name,
      this.price,
      required this.imagePath,
      this.link = '',
      this.soldOut = false});

  @override
  final String? number;
  @override
  final String name;
  @override
  final String? price;
  @override
  final String imagePath;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final bool soldOut;

  /// Create a copy of NewsItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsItemDataCopyWith<_NewsItemData> get copyWith =>
      __$NewsItemDataCopyWithImpl<_NewsItemData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsItemData &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.soldOut, soldOut) || other.soldOut == soldOut));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, name, price, imagePath, link, soldOut);

  @override
  String toString() {
    return 'NewsItemData(number: $number, name: $name, price: $price, imagePath: $imagePath, link: $link, soldOut: $soldOut)';
  }
}

/// @nodoc
abstract mixin class _$NewsItemDataCopyWith<$Res>
    implements $NewsItemDataCopyWith<$Res> {
  factory _$NewsItemDataCopyWith(
          _NewsItemData value, $Res Function(_NewsItemData) _then) =
      __$NewsItemDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? number,
      String name,
      String? price,
      String imagePath,
      String link,
      bool soldOut});
}

/// @nodoc
class __$NewsItemDataCopyWithImpl<$Res>
    implements _$NewsItemDataCopyWith<$Res> {
  __$NewsItemDataCopyWithImpl(this._self, this._then);

  final _NewsItemData _self;
  final $Res Function(_NewsItemData) _then;

  /// Create a copy of NewsItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = freezed,
    Object? name = null,
    Object? price = freezed,
    Object? imagePath = null,
    Object? link = null,
    Object? soldOut = null,
  }) {
    return _then(_NewsItemData(
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      soldOut: null == soldOut
          ? _self.soldOut
          : soldOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

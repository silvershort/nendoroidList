// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsState {
  List<NewsItemData> get specialGoodsList;
  List<NewsItemData> get ninimalList;
  List<NewsItemData> get imminentList;
  GoodSmileNewsModel? get goodSmileNewsModel;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsStateCopyWith<NewsState> get copyWith =>
      _$NewsStateCopyWithImpl<NewsState>(this as NewsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsState &&
            const DeepCollectionEquality()
                .equals(other.specialGoodsList, specialGoodsList) &&
            const DeepCollectionEquality()
                .equals(other.ninimalList, ninimalList) &&
            const DeepCollectionEquality()
                .equals(other.imminentList, imminentList) &&
            (identical(other.goodSmileNewsModel, goodSmileNewsModel) ||
                other.goodSmileNewsModel == goodSmileNewsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(specialGoodsList),
      const DeepCollectionEquality().hash(ninimalList),
      const DeepCollectionEquality().hash(imminentList),
      goodSmileNewsModel);

  @override
  String toString() {
    return 'NewsState(specialGoodsList: $specialGoodsList, ninimalList: $ninimalList, imminentList: $imminentList, goodSmileNewsModel: $goodSmileNewsModel)';
  }
}

/// @nodoc
abstract mixin class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) _then) =
      _$NewsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<NewsItemData> specialGoodsList,
      List<NewsItemData> ninimalList,
      List<NewsItemData> imminentList,
      GoodSmileNewsModel? goodSmileNewsModel});

  $GoodSmileNewsModelCopyWith<$Res>? get goodSmileNewsModel;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._self, this._then);

  final NewsState _self;
  final $Res Function(NewsState) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialGoodsList = null,
    Object? ninimalList = null,
    Object? imminentList = null,
    Object? goodSmileNewsModel = freezed,
  }) {
    return _then(_self.copyWith(
      specialGoodsList: null == specialGoodsList
          ? _self.specialGoodsList
          : specialGoodsList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      ninimalList: null == ninimalList
          ? _self.ninimalList
          : ninimalList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      imminentList: null == imminentList
          ? _self.imminentList
          : imminentList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      goodSmileNewsModel: freezed == goodSmileNewsModel
          ? _self.goodSmileNewsModel
          : goodSmileNewsModel // ignore: cast_nullable_to_non_nullable
              as GoodSmileNewsModel?,
    ));
  }

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GoodSmileNewsModelCopyWith<$Res>? get goodSmileNewsModel {
    if (_self.goodSmileNewsModel == null) {
      return null;
    }

    return $GoodSmileNewsModelCopyWith<$Res>(_self.goodSmileNewsModel!,
        (value) {
      return _then(_self.copyWith(goodSmileNewsModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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
    TResult Function(_NewsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
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
    TResult Function(_NewsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState():
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
    TResult? Function(_NewsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
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
            List<NewsItemData> specialGoodsList,
            List<NewsItemData> ninimalList,
            List<NewsItemData> imminentList,
            GoodSmileNewsModel? goodSmileNewsModel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
        return $default(_that.specialGoodsList, _that.ninimalList,
            _that.imminentList, _that.goodSmileNewsModel);
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
            List<NewsItemData> specialGoodsList,
            List<NewsItemData> ninimalList,
            List<NewsItemData> imminentList,
            GoodSmileNewsModel? goodSmileNewsModel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState():
        return $default(_that.specialGoodsList, _that.ninimalList,
            _that.imminentList, _that.goodSmileNewsModel);
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
            List<NewsItemData> specialGoodsList,
            List<NewsItemData> ninimalList,
            List<NewsItemData> imminentList,
            GoodSmileNewsModel? goodSmileNewsModel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
        return $default(_that.specialGoodsList, _that.ninimalList,
            _that.imminentList, _that.goodSmileNewsModel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewsState implements NewsState {
  const _NewsState(
      {final List<NewsItemData> specialGoodsList = const [],
      final List<NewsItemData> ninimalList = const [],
      final List<NewsItemData> imminentList = const [],
      this.goodSmileNewsModel})
      : _specialGoodsList = specialGoodsList,
        _ninimalList = ninimalList,
        _imminentList = imminentList;

  final List<NewsItemData> _specialGoodsList;
  @override
  @JsonKey()
  List<NewsItemData> get specialGoodsList {
    if (_specialGoodsList is EqualUnmodifiableListView)
      return _specialGoodsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialGoodsList);
  }

  final List<NewsItemData> _ninimalList;
  @override
  @JsonKey()
  List<NewsItemData> get ninimalList {
    if (_ninimalList is EqualUnmodifiableListView) return _ninimalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ninimalList);
  }

  final List<NewsItemData> _imminentList;
  @override
  @JsonKey()
  List<NewsItemData> get imminentList {
    if (_imminentList is EqualUnmodifiableListView) return _imminentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imminentList);
  }

  @override
  final GoodSmileNewsModel? goodSmileNewsModel;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      __$NewsStateCopyWithImpl<_NewsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsState &&
            const DeepCollectionEquality()
                .equals(other._specialGoodsList, _specialGoodsList) &&
            const DeepCollectionEquality()
                .equals(other._ninimalList, _ninimalList) &&
            const DeepCollectionEquality()
                .equals(other._imminentList, _imminentList) &&
            (identical(other.goodSmileNewsModel, goodSmileNewsModel) ||
                other.goodSmileNewsModel == goodSmileNewsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_specialGoodsList),
      const DeepCollectionEquality().hash(_ninimalList),
      const DeepCollectionEquality().hash(_imminentList),
      goodSmileNewsModel);

  @override
  String toString() {
    return 'NewsState(specialGoodsList: $specialGoodsList, ninimalList: $ninimalList, imminentList: $imminentList, goodSmileNewsModel: $goodSmileNewsModel)';
  }
}

/// @nodoc
abstract mixin class _$NewsStateCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(
          _NewsState value, $Res Function(_NewsState) _then) =
      __$NewsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NewsItemData> specialGoodsList,
      List<NewsItemData> ninimalList,
      List<NewsItemData> imminentList,
      GoodSmileNewsModel? goodSmileNewsModel});

  @override
  $GoodSmileNewsModelCopyWith<$Res>? get goodSmileNewsModel;
}

/// @nodoc
class __$NewsStateCopyWithImpl<$Res> implements _$NewsStateCopyWith<$Res> {
  __$NewsStateCopyWithImpl(this._self, this._then);

  final _NewsState _self;
  final $Res Function(_NewsState) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? specialGoodsList = null,
    Object? ninimalList = null,
    Object? imminentList = null,
    Object? goodSmileNewsModel = freezed,
  }) {
    return _then(_NewsState(
      specialGoodsList: null == specialGoodsList
          ? _self._specialGoodsList
          : specialGoodsList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      ninimalList: null == ninimalList
          ? _self._ninimalList
          : ninimalList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      imminentList: null == imminentList
          ? _self._imminentList
          : imminentList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      goodSmileNewsModel: freezed == goodSmileNewsModel
          ? _self.goodSmileNewsModel
          : goodSmileNewsModel // ignore: cast_nullable_to_non_nullable
              as GoodSmileNewsModel?,
    ));
  }

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GoodSmileNewsModelCopyWith<$Res>? get goodSmileNewsModel {
    if (_self.goodSmileNewsModel == null) {
      return null;
    }

    return $GoodSmileNewsModelCopyWith<$Res>(_self.goodSmileNewsModel!,
        (value) {
      return _then(_self.copyWith(goodSmileNewsModel: value));
    });
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'good_smile_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoodSmileNewsModel {
  String get link;
  List<String> get nendoNameList;
  List<NendoData> get nendoList;

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoodSmileNewsModelCopyWith<GoodSmileNewsModel> get copyWith =>
      _$GoodSmileNewsModelCopyWithImpl<GoodSmileNewsModel>(
          this as GoodSmileNewsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoodSmileNewsModel &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other.nendoNameList, nendoNameList) &&
            const DeepCollectionEquality().equals(other.nendoList, nendoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      link,
      const DeepCollectionEquality().hash(nendoNameList),
      const DeepCollectionEquality().hash(nendoList));

  @override
  String toString() {
    return 'GoodSmileNewsModel(link: $link, nendoNameList: $nendoNameList, nendoList: $nendoList)';
  }
}

/// @nodoc
abstract mixin class $GoodSmileNewsModelCopyWith<$Res> {
  factory $GoodSmileNewsModelCopyWith(
          GoodSmileNewsModel value, $Res Function(GoodSmileNewsModel) _then) =
      _$GoodSmileNewsModelCopyWithImpl;
  @useResult
  $Res call(
      {String link, List<String> nendoNameList, List<NendoData> nendoList});
}

/// @nodoc
class _$GoodSmileNewsModelCopyWithImpl<$Res>
    implements $GoodSmileNewsModelCopyWith<$Res> {
  _$GoodSmileNewsModelCopyWithImpl(this._self, this._then);

  final GoodSmileNewsModel _self;
  final $Res Function(GoodSmileNewsModel) _then;

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? nendoNameList = null,
    Object? nendoList = null,
  }) {
    return _then(_self.copyWith(
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      nendoNameList: null == nendoNameList
          ? _self.nendoNameList
          : nendoNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nendoList: null == nendoList
          ? _self.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GoodSmileNewsModel].
extension GoodSmileNewsModelPatterns on GoodSmileNewsModel {
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
    TResult Function(_GoodSmileNewsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GoodSmileNewsModel() when $default != null:
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
    TResult Function(_GoodSmileNewsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GoodSmileNewsModel():
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
    TResult? Function(_GoodSmileNewsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GoodSmileNewsModel() when $default != null:
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
            String link, List<String> nendoNameList, List<NendoData> nendoList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GoodSmileNewsModel() when $default != null:
        return $default(_that.link, _that.nendoNameList, _that.nendoList);
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
            String link, List<String> nendoNameList, List<NendoData> nendoList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GoodSmileNewsModel():
        return $default(_that.link, _that.nendoNameList, _that.nendoList);
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
            String link, List<String> nendoNameList, List<NendoData> nendoList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GoodSmileNewsModel() when $default != null:
        return $default(_that.link, _that.nendoNameList, _that.nendoList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GoodSmileNewsModel implements GoodSmileNewsModel {
  const _GoodSmileNewsModel(
      {required this.link,
      final List<String> nendoNameList = const [],
      final List<NendoData> nendoList = const []})
      : _nendoNameList = nendoNameList,
        _nendoList = nendoList;

  @override
  final String link;
  final List<String> _nendoNameList;
  @override
  @JsonKey()
  List<String> get nendoNameList {
    if (_nendoNameList is EqualUnmodifiableListView) return _nendoNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoNameList);
  }

  final List<NendoData> _nendoList;
  @override
  @JsonKey()
  List<NendoData> get nendoList {
    if (_nendoList is EqualUnmodifiableListView) return _nendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GoodSmileNewsModelCopyWith<_GoodSmileNewsModel> get copyWith =>
      __$GoodSmileNewsModelCopyWithImpl<_GoodSmileNewsModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoodSmileNewsModel &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._nendoNameList, _nendoNameList) &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      link,
      const DeepCollectionEquality().hash(_nendoNameList),
      const DeepCollectionEquality().hash(_nendoList));

  @override
  String toString() {
    return 'GoodSmileNewsModel(link: $link, nendoNameList: $nendoNameList, nendoList: $nendoList)';
  }
}

/// @nodoc
abstract mixin class _$GoodSmileNewsModelCopyWith<$Res>
    implements $GoodSmileNewsModelCopyWith<$Res> {
  factory _$GoodSmileNewsModelCopyWith(
          _GoodSmileNewsModel value, $Res Function(_GoodSmileNewsModel) _then) =
      __$GoodSmileNewsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String link, List<String> nendoNameList, List<NendoData> nendoList});
}

/// @nodoc
class __$GoodSmileNewsModelCopyWithImpl<$Res>
    implements _$GoodSmileNewsModelCopyWith<$Res> {
  __$GoodSmileNewsModelCopyWithImpl(this._self, this._then);

  final _GoodSmileNewsModel _self;
  final $Res Function(_GoodSmileNewsModel) _then;

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? link = null,
    Object? nendoNameList = null,
    Object? nendoList = null,
  }) {
    return _then(_GoodSmileNewsModel(
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      nendoNameList: null == nendoNameList
          ? _self._nendoNameList
          : nendoNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nendoList: null == nendoList
          ? _self._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ));
  }
}

// dart format on

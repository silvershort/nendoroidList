// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_image_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NendoImageState {
  List<String> get imageList;
  List<String> get thumbnailList;

  /// Create a copy of NendoImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoImageStateCopyWith<NendoImageState> get copyWith =>
      _$NendoImageStateCopyWithImpl<NendoImageState>(
          this as NendoImageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoImageState &&
            const DeepCollectionEquality().equals(other.imageList, imageList) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailList, thumbnailList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageList),
      const DeepCollectionEquality().hash(thumbnailList));

  @override
  String toString() {
    return 'NendoImageState(imageList: $imageList, thumbnailList: $thumbnailList)';
  }
}

/// @nodoc
abstract mixin class $NendoImageStateCopyWith<$Res> {
  factory $NendoImageStateCopyWith(
          NendoImageState value, $Res Function(NendoImageState) _then) =
      _$NendoImageStateCopyWithImpl;
  @useResult
  $Res call({List<String> imageList, List<String> thumbnailList});
}

/// @nodoc
class _$NendoImageStateCopyWithImpl<$Res>
    implements $NendoImageStateCopyWith<$Res> {
  _$NendoImageStateCopyWithImpl(this._self, this._then);

  final NendoImageState _self;
  final $Res Function(NendoImageState) _then;

  /// Create a copy of NendoImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageList = null,
    Object? thumbnailList = null,
  }) {
    return _then(_self.copyWith(
      imageList: null == imageList
          ? _self.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailList: null == thumbnailList
          ? _self.thumbnailList
          : thumbnailList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NendoImageState].
extension NendoImageStatePatterns on NendoImageState {
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
    TResult Function(_NendoImageState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoImageState() when $default != null:
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
    TResult Function(_NendoImageState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoImageState():
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
    TResult? Function(_NendoImageState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoImageState() when $default != null:
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
    TResult Function(List<String> imageList, List<String> thumbnailList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoImageState() when $default != null:
        return $default(_that.imageList, _that.thumbnailList);
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
    TResult Function(List<String> imageList, List<String> thumbnailList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoImageState():
        return $default(_that.imageList, _that.thumbnailList);
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
    TResult? Function(List<String> imageList, List<String> thumbnailList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoImageState() when $default != null:
        return $default(_that.imageList, _that.thumbnailList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NendoImageState implements NendoImageState {
  const _NendoImageState(
      {required final List<String> imageList,
      required final List<String> thumbnailList})
      : _imageList = imageList,
        _thumbnailList = thumbnailList;

  final List<String> _imageList;
  @override
  List<String> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  final List<String> _thumbnailList;
  @override
  List<String> get thumbnailList {
    if (_thumbnailList is EqualUnmodifiableListView) return _thumbnailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnailList);
  }

  /// Create a copy of NendoImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoImageStateCopyWith<_NendoImageState> get copyWith =>
      __$NendoImageStateCopyWithImpl<_NendoImageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoImageState &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            const DeepCollectionEquality()
                .equals(other._thumbnailList, _thumbnailList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imageList),
      const DeepCollectionEquality().hash(_thumbnailList));

  @override
  String toString() {
    return 'NendoImageState(imageList: $imageList, thumbnailList: $thumbnailList)';
  }
}

/// @nodoc
abstract mixin class _$NendoImageStateCopyWith<$Res>
    implements $NendoImageStateCopyWith<$Res> {
  factory _$NendoImageStateCopyWith(
          _NendoImageState value, $Res Function(_NendoImageState) _then) =
      __$NendoImageStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> imageList, List<String> thumbnailList});
}

/// @nodoc
class __$NendoImageStateCopyWithImpl<$Res>
    implements _$NendoImageStateCopyWith<$Res> {
  __$NendoImageStateCopyWithImpl(this._self, this._then);

  final _NendoImageState _self;
  final $Res Function(_NendoImageState) _then;

  /// Create a copy of NendoImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageList = null,
    Object? thumbnailList = null,
  }) {
    return _then(_NendoImageState(
      imageList: null == imageList
          ? _self._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailList: null == thumbnailList
          ? _self._thumbnailList
          : thumbnailList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on

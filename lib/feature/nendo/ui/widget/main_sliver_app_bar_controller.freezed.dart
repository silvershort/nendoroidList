// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_sliver_app_bar_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListAppBarState {
  bool get isSearchMode;
  String get searchText;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListAppBarStateCopyWith<ListAppBarState> get copyWith =>
      _$ListAppBarStateCopyWithImpl<ListAppBarState>(
          this as ListAppBarState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListAppBarState &&
            (identical(other.isSearchMode, isSearchMode) ||
                other.isSearchMode == isSearchMode) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearchMode, searchText);

  @override
  String toString() {
    return 'ListAppBarState(isSearchMode: $isSearchMode, searchText: $searchText)';
  }
}

/// @nodoc
abstract mixin class $ListAppBarStateCopyWith<$Res> {
  factory $ListAppBarStateCopyWith(
          ListAppBarState value, $Res Function(ListAppBarState) _then) =
      _$ListAppBarStateCopyWithImpl;
  @useResult
  $Res call({bool isSearchMode, String searchText});
}

/// @nodoc
class _$ListAppBarStateCopyWithImpl<$Res>
    implements $ListAppBarStateCopyWith<$Res> {
  _$ListAppBarStateCopyWithImpl(this._self, this._then);

  final ListAppBarState _self;
  final $Res Function(ListAppBarState) _then;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchMode = null,
    Object? searchText = null,
  }) {
    return _then(_self.copyWith(
      isSearchMode: null == isSearchMode
          ? _self.isSearchMode
          : isSearchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _self.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListAppBarState].
extension ListAppBarStatePatterns on ListAppBarState {
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
    TResult Function(_ListAppBarState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListAppBarState() when $default != null:
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
    TResult Function(_ListAppBarState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListAppBarState():
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
    TResult? Function(_ListAppBarState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListAppBarState() when $default != null:
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
    TResult Function(bool isSearchMode, String searchText)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListAppBarState() when $default != null:
        return $default(_that.isSearchMode, _that.searchText);
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
    TResult Function(bool isSearchMode, String searchText) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListAppBarState():
        return $default(_that.isSearchMode, _that.searchText);
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
    TResult? Function(bool isSearchMode, String searchText)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListAppBarState() when $default != null:
        return $default(_that.isSearchMode, _that.searchText);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ListAppBarState implements ListAppBarState {
  const _ListAppBarState({this.isSearchMode = false, this.searchText = ''});

  @override
  @JsonKey()
  final bool isSearchMode;
  @override
  @JsonKey()
  final String searchText;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListAppBarStateCopyWith<_ListAppBarState> get copyWith =>
      __$ListAppBarStateCopyWithImpl<_ListAppBarState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListAppBarState &&
            (identical(other.isSearchMode, isSearchMode) ||
                other.isSearchMode == isSearchMode) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearchMode, searchText);

  @override
  String toString() {
    return 'ListAppBarState(isSearchMode: $isSearchMode, searchText: $searchText)';
  }
}

/// @nodoc
abstract mixin class _$ListAppBarStateCopyWith<$Res>
    implements $ListAppBarStateCopyWith<$Res> {
  factory _$ListAppBarStateCopyWith(
          _ListAppBarState value, $Res Function(_ListAppBarState) _then) =
      __$ListAppBarStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isSearchMode, String searchText});
}

/// @nodoc
class __$ListAppBarStateCopyWithImpl<$Res>
    implements _$ListAppBarStateCopyWith<$Res> {
  __$ListAppBarStateCopyWithImpl(this._self, this._then);

  final _ListAppBarState _self;
  final $Res Function(_ListAppBarState) _then;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isSearchMode = null,
    Object? searchText = null,
  }) {
    return _then(_ListAppBarState(
      isSearchMode: null == isSearchMode
          ? _self.isSearchMode
          : isSearchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _self.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

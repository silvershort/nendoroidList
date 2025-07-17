// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_sliver_app_bar_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListAppBarState {
  bool get isSearchMode => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListAppBarStateCopyWith<ListAppBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListAppBarStateCopyWith<$Res> {
  factory $ListAppBarStateCopyWith(
          ListAppBarState value, $Res Function(ListAppBarState) then) =
      _$ListAppBarStateCopyWithImpl<$Res, ListAppBarState>;
  @useResult
  $Res call({bool isSearchMode, String searchText});
}

/// @nodoc
class _$ListAppBarStateCopyWithImpl<$Res, $Val extends ListAppBarState>
    implements $ListAppBarStateCopyWith<$Res> {
  _$ListAppBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchMode = null,
    Object? searchText = null,
  }) {
    return _then(_value.copyWith(
      isSearchMode: null == isSearchMode
          ? _value.isSearchMode
          : isSearchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListAppBarStateImplCopyWith<$Res>
    implements $ListAppBarStateCopyWith<$Res> {
  factory _$$ListAppBarStateImplCopyWith(_$ListAppBarStateImpl value,
          $Res Function(_$ListAppBarStateImpl) then) =
      __$$ListAppBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSearchMode, String searchText});
}

/// @nodoc
class __$$ListAppBarStateImplCopyWithImpl<$Res>
    extends _$ListAppBarStateCopyWithImpl<$Res, _$ListAppBarStateImpl>
    implements _$$ListAppBarStateImplCopyWith<$Res> {
  __$$ListAppBarStateImplCopyWithImpl(
      _$ListAppBarStateImpl _value, $Res Function(_$ListAppBarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchMode = null,
    Object? searchText = null,
  }) {
    return _then(_$ListAppBarStateImpl(
      isSearchMode: null == isSearchMode
          ? _value.isSearchMode
          : isSearchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ListAppBarStateImpl implements _ListAppBarState {
  const _$ListAppBarStateImpl(
      {this.isSearchMode = false, this.searchText = ''});

  @override
  @JsonKey()
  final bool isSearchMode;
  @override
  @JsonKey()
  final String searchText;

  @override
  String toString() {
    return 'ListAppBarState(isSearchMode: $isSearchMode, searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListAppBarStateImpl &&
            (identical(other.isSearchMode, isSearchMode) ||
                other.isSearchMode == isSearchMode) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearchMode, searchText);

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListAppBarStateImplCopyWith<_$ListAppBarStateImpl> get copyWith =>
      __$$ListAppBarStateImplCopyWithImpl<_$ListAppBarStateImpl>(
          this, _$identity);
}

abstract class _ListAppBarState implements ListAppBarState {
  const factory _ListAppBarState(
      {final bool isSearchMode,
      final String searchText}) = _$ListAppBarStateImpl;

  @override
  bool get isSearchMode;
  @override
  String get searchText;

  /// Create a copy of ListAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListAppBarStateImplCopyWith<_$ListAppBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

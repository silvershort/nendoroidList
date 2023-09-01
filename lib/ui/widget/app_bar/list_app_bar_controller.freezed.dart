// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_app_bar_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListAppBarState {
  bool get isSearchMode => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
abstract class _$$_ListAppBarStateCopyWith<$Res>
    implements $ListAppBarStateCopyWith<$Res> {
  factory _$$_ListAppBarStateCopyWith(
          _$_ListAppBarState value, $Res Function(_$_ListAppBarState) then) =
      __$$_ListAppBarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSearchMode, String searchText});
}

/// @nodoc
class __$$_ListAppBarStateCopyWithImpl<$Res>
    extends _$ListAppBarStateCopyWithImpl<$Res, _$_ListAppBarState>
    implements _$$_ListAppBarStateCopyWith<$Res> {
  __$$_ListAppBarStateCopyWithImpl(
      _$_ListAppBarState _value, $Res Function(_$_ListAppBarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchMode = null,
    Object? searchText = null,
  }) {
    return _then(_$_ListAppBarState(
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

class _$_ListAppBarState implements _ListAppBarState {
  const _$_ListAppBarState({this.isSearchMode = false, this.searchText = ''});

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListAppBarState &&
            (identical(other.isSearchMode, isSearchMode) ||
                other.isSearchMode == isSearchMode) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearchMode, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListAppBarStateCopyWith<_$_ListAppBarState> get copyWith =>
      __$$_ListAppBarStateCopyWithImpl<_$_ListAppBarState>(this, _$identity);
}

abstract class _ListAppBarState implements ListAppBarState {
  const factory _ListAppBarState(
      {final bool isSearchMode, final String searchText}) = _$_ListAppBarState;

  @override
  bool get isSearchMode;
  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$_ListAppBarStateCopyWith<_$_ListAppBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

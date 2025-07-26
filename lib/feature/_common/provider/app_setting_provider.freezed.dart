// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingState {
  MaterialColor get seedColor;
  Brightness get brightness;
  bool get showGroupHeader;
  int get groupMethod;
  bool get hideUI;
  int get gridCount;
  bool get autoPlay;
  String get appFont;
  bool get usePopup;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppSettingStateCopyWith<AppSettingState> get copyWith =>
      _$AppSettingStateCopyWithImpl<AppSettingState>(
          this as AppSettingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppSettingState &&
            (identical(other.seedColor, seedColor) ||
                other.seedColor == seedColor) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.showGroupHeader, showGroupHeader) ||
                other.showGroupHeader == showGroupHeader) &&
            (identical(other.groupMethod, groupMethod) ||
                other.groupMethod == groupMethod) &&
            (identical(other.hideUI, hideUI) || other.hideUI == hideUI) &&
            (identical(other.gridCount, gridCount) ||
                other.gridCount == gridCount) &&
            (identical(other.autoPlay, autoPlay) ||
                other.autoPlay == autoPlay) &&
            (identical(other.appFont, appFont) || other.appFont == appFont) &&
            (identical(other.usePopup, usePopup) ||
                other.usePopup == usePopup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      seedColor,
      brightness,
      showGroupHeader,
      groupMethod,
      hideUI,
      gridCount,
      autoPlay,
      appFont,
      usePopup);

  @override
  String toString() {
    return 'AppSettingState(seedColor: $seedColor, brightness: $brightness, showGroupHeader: $showGroupHeader, groupMethod: $groupMethod, hideUI: $hideUI, gridCount: $gridCount, autoPlay: $autoPlay, appFont: $appFont, usePopup: $usePopup)';
  }
}

/// @nodoc
abstract mixin class $AppSettingStateCopyWith<$Res> {
  factory $AppSettingStateCopyWith(
          AppSettingState value, $Res Function(AppSettingState) _then) =
      _$AppSettingStateCopyWithImpl;
  @useResult
  $Res call(
      {MaterialColor seedColor,
      Brightness brightness,
      bool showGroupHeader,
      int groupMethod,
      bool hideUI,
      int gridCount,
      bool autoPlay,
      String appFont,
      bool usePopup});
}

/// @nodoc
class _$AppSettingStateCopyWithImpl<$Res>
    implements $AppSettingStateCopyWith<$Res> {
  _$AppSettingStateCopyWithImpl(this._self, this._then);

  final AppSettingState _self;
  final $Res Function(AppSettingState) _then;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedColor = null,
    Object? brightness = null,
    Object? showGroupHeader = null,
    Object? groupMethod = null,
    Object? hideUI = null,
    Object? gridCount = null,
    Object? autoPlay = null,
    Object? appFont = null,
    Object? usePopup = null,
  }) {
    return _then(_self.copyWith(
      seedColor: null == seedColor
          ? _self.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
      brightness: null == brightness
          ? _self.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      showGroupHeader: null == showGroupHeader
          ? _self.showGroupHeader
          : showGroupHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      groupMethod: null == groupMethod
          ? _self.groupMethod
          : groupMethod // ignore: cast_nullable_to_non_nullable
              as int,
      hideUI: null == hideUI
          ? _self.hideUI
          : hideUI // ignore: cast_nullable_to_non_nullable
              as bool,
      gridCount: null == gridCount
          ? _self.gridCount
          : gridCount // ignore: cast_nullable_to_non_nullable
              as int,
      autoPlay: null == autoPlay
          ? _self.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      appFont: null == appFont
          ? _self.appFont
          : appFont // ignore: cast_nullable_to_non_nullable
              as String,
      usePopup: null == usePopup
          ? _self.usePopup
          : usePopup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppSettingState].
extension AppSettingStatePatterns on AppSettingState {
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
    TResult Function(_AppSettingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppSettingState() when $default != null:
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
    TResult Function(_AppSettingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingState():
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
    TResult? Function(_AppSettingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingState() when $default != null:
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
            MaterialColor seedColor,
            Brightness brightness,
            bool showGroupHeader,
            int groupMethod,
            bool hideUI,
            int gridCount,
            bool autoPlay,
            String appFont,
            bool usePopup)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppSettingState() when $default != null:
        return $default(
            _that.seedColor,
            _that.brightness,
            _that.showGroupHeader,
            _that.groupMethod,
            _that.hideUI,
            _that.gridCount,
            _that.autoPlay,
            _that.appFont,
            _that.usePopup);
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
            MaterialColor seedColor,
            Brightness brightness,
            bool showGroupHeader,
            int groupMethod,
            bool hideUI,
            int gridCount,
            bool autoPlay,
            String appFont,
            bool usePopup)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingState():
        return $default(
            _that.seedColor,
            _that.brightness,
            _that.showGroupHeader,
            _that.groupMethod,
            _that.hideUI,
            _that.gridCount,
            _that.autoPlay,
            _that.appFont,
            _that.usePopup);
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
            MaterialColor seedColor,
            Brightness brightness,
            bool showGroupHeader,
            int groupMethod,
            bool hideUI,
            int gridCount,
            bool autoPlay,
            String appFont,
            bool usePopup)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingState() when $default != null:
        return $default(
            _that.seedColor,
            _that.brightness,
            _that.showGroupHeader,
            _that.groupMethod,
            _that.hideUI,
            _that.gridCount,
            _that.autoPlay,
            _that.appFont,
            _that.usePopup);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppSettingState implements AppSettingState {
  const _AppSettingState(
      {required this.seedColor,
      required this.brightness,
      required this.showGroupHeader,
      required this.groupMethod,
      required this.hideUI,
      required this.gridCount,
      required this.autoPlay,
      required this.appFont,
      required this.usePopup});

  @override
  final MaterialColor seedColor;
  @override
  final Brightness brightness;
  @override
  final bool showGroupHeader;
  @override
  final int groupMethod;
  @override
  final bool hideUI;
  @override
  final int gridCount;
  @override
  final bool autoPlay;
  @override
  final String appFont;
  @override
  final bool usePopup;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppSettingStateCopyWith<_AppSettingState> get copyWith =>
      __$AppSettingStateCopyWithImpl<_AppSettingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppSettingState &&
            (identical(other.seedColor, seedColor) ||
                other.seedColor == seedColor) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.showGroupHeader, showGroupHeader) ||
                other.showGroupHeader == showGroupHeader) &&
            (identical(other.groupMethod, groupMethod) ||
                other.groupMethod == groupMethod) &&
            (identical(other.hideUI, hideUI) || other.hideUI == hideUI) &&
            (identical(other.gridCount, gridCount) ||
                other.gridCount == gridCount) &&
            (identical(other.autoPlay, autoPlay) ||
                other.autoPlay == autoPlay) &&
            (identical(other.appFont, appFont) || other.appFont == appFont) &&
            (identical(other.usePopup, usePopup) ||
                other.usePopup == usePopup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      seedColor,
      brightness,
      showGroupHeader,
      groupMethod,
      hideUI,
      gridCount,
      autoPlay,
      appFont,
      usePopup);

  @override
  String toString() {
    return 'AppSettingState(seedColor: $seedColor, brightness: $brightness, showGroupHeader: $showGroupHeader, groupMethod: $groupMethod, hideUI: $hideUI, gridCount: $gridCount, autoPlay: $autoPlay, appFont: $appFont, usePopup: $usePopup)';
  }
}

/// @nodoc
abstract mixin class _$AppSettingStateCopyWith<$Res>
    implements $AppSettingStateCopyWith<$Res> {
  factory _$AppSettingStateCopyWith(
          _AppSettingState value, $Res Function(_AppSettingState) _then) =
      __$AppSettingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MaterialColor seedColor,
      Brightness brightness,
      bool showGroupHeader,
      int groupMethod,
      bool hideUI,
      int gridCount,
      bool autoPlay,
      String appFont,
      bool usePopup});
}

/// @nodoc
class __$AppSettingStateCopyWithImpl<$Res>
    implements _$AppSettingStateCopyWith<$Res> {
  __$AppSettingStateCopyWithImpl(this._self, this._then);

  final _AppSettingState _self;
  final $Res Function(_AppSettingState) _then;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? seedColor = null,
    Object? brightness = null,
    Object? showGroupHeader = null,
    Object? groupMethod = null,
    Object? hideUI = null,
    Object? gridCount = null,
    Object? autoPlay = null,
    Object? appFont = null,
    Object? usePopup = null,
  }) {
    return _then(_AppSettingState(
      seedColor: null == seedColor
          ? _self.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
      brightness: null == brightness
          ? _self.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      showGroupHeader: null == showGroupHeader
          ? _self.showGroupHeader
          : showGroupHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      groupMethod: null == groupMethod
          ? _self.groupMethod
          : groupMethod // ignore: cast_nullable_to_non_nullable
              as int,
      hideUI: null == hideUI
          ? _self.hideUI
          : hideUI // ignore: cast_nullable_to_non_nullable
              as bool,
      gridCount: null == gridCount
          ? _self.gridCount
          : gridCount // ignore: cast_nullable_to_non_nullable
              as int,
      autoPlay: null == autoPlay
          ? _self.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      appFont: null == appFont
          ? _self.appFont
          : appFont // ignore: cast_nullable_to_non_nullable
              as String,
      usePopup: null == usePopup
          ? _self.usePopup
          : usePopup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

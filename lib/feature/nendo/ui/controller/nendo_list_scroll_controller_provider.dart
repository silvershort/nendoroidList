import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_list_scroll_controller_provider.g.dart';

@riverpod
// ignore: unsupported_provider_value
class NendoListScrollController extends _$NendoListScrollController {
  @override
  ScrollController build() {
    final controller = ScrollController();
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}
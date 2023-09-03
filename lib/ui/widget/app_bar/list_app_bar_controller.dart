import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/utilities/debounce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_app_bar_controller.freezed.dart';
part 'list_app_bar_controller.g.dart';

@Riverpod(keepAlive: true)
class ListAppBarController extends _$ListAppBarController {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final Debounce _debounce = Debounce(milliseconds: 150);

  @override
  ListAppBarState build() {
    return const ListAppBarState();
  }

  void debounceSearch() {
    _debounce.run(() => ref.read(nendoProvider.notifier).searchToWord(state.searchText));
  }

  void setSearchText(String searchText) {
    state = state.copyWith(
      searchText: searchText,
    );
  }

  void setSearchMode(bool searchMode) {
    state = state.copyWith(
      isSearchMode: searchMode,
    );
  }

  void clearTextField() {
    searchTextController.clear();
    state = state.copyWith(
      searchText: '',
    );
    ref.read(nendoProvider.notifier).searchToWord("");
  }
}

@freezed
class ListAppBarState with _$ListAppBarState {
  const factory ListAppBarState({
    @Default(false) bool isSearchMode,
    @Default('') String searchText,
}) = _ListAppBarState;
}
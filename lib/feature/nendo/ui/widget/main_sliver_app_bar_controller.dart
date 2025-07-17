import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/app/util/debounce.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_sliver_app_bar_controller.freezed.dart';
part 'main_sliver_app_bar_controller.g.dart';

@freezed
class ListAppBarState with _$ListAppBarState {
  const factory ListAppBarState({
    @Default(false) bool isSearchMode,
    @Default('') String searchText,
  }) = _ListAppBarState;
}

@Riverpod(keepAlive: true)
class MainSliverAppBarController extends _$MainSliverAppBarController {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final Debounce _debounce = Debounce(milliseconds: 150);

  @override
  ListAppBarState build() {
    return const ListAppBarState();
  }

  // debounce를 적용하여 넨도리스트를 검색
  void debounceSearch() {
    _debounce.run(() => ref.read(nendoProvider.notifier).searchToWord(state.searchText));
  }

  // 검색된 단어를 상태에 저장
  void setSearchText(String searchText) {
    state = state.copyWith(
      searchText: searchText,
    );
  }

  // 앱바 검색 버튼을 눌렀을때 검색모드로 상태를 변경
  void setSearchMode(bool searchMode) {
    state = state.copyWith(
      isSearchMode: searchMode,
    );
  }

  // 검색어 삭제 버튼을 눌렀을때 검색어가 초기화 되도록 설정
  void clearTextField() {
    searchTextController.clear();
    state = state.copyWith(
      searchText: '',
    );
    ref.read(nendoProvider.notifier).searchToWord("");
  }
}
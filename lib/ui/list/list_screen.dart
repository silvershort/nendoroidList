import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/ui/_common_widget/animation/scroll_to_opacity_widget.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/list_app_bar.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/list_app_bar_controller.dart';
import 'package:nendoroid_db/ui/_common_widget/bottom_sheet/filter_bottom_sheet.dart';
import 'package:nendoroid_db/ui/list/widget/list_main_widget.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          thickness: 5.0,
          radius: const Radius.circular(5.0),
          controller: scrollController,
          interactive: true,
          trackVisibility: true,
          thumbVisibility: true,
          child: NotificationListener<ScrollNotification>(
            // 스크롤 했을때 검색창 포커스 해제
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                if (ref.watch(listAppBarControllerProvider).isSearchMode) {
                  FocusScope.of(context).unfocus();
                }
              }
              return true;
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              slivers: const [
                ListAppBar(),
                ListMainWidget(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ScrollToOpacityWidget(
        controller: scrollController,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const FilterBottomSheet();
              },
            );
          },
          child: const Icon(
            Icons.filter_alt,
          ),
        ),
      ),
    );
  }
}

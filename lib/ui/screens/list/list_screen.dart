import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/widget/animation/scroll_to_opacity_widget.dart';
import 'package:nendoroid_db/ui/widget/app_bar/list_app_bar.dart';
import 'package:nendoroid_db/ui/widget/app_bar/list_app_bar_controller.dart';
import 'package:nendoroid_db/ui/widget/bottom_sheet/filter_bottom_sheet.dart';
import 'package:nendoroid_db/ui/widget/tile/nendo_list_tile.dart';

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
      body: Scrollbar(
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
              ListMainView(),
            ],
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

class ListMainView extends ConsumerWidget {
  const ListMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoProvider);
    final controller = ref.read(nendoProvider.notifier);

    return state.when(
      data: (data) {
        return SliverList.builder(
          itemCount: data.filteredNendoList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              if (ref.watch(listAppBarControllerProvider).isSearchMode) {
                return Container(
                  height: 24,
                  padding: const EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "검색된 넨도로이드 수 : ${data.filteredNendoList.length}",
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            } else {
              return NendoListTile(nendoData: data.filteredNendoList[index - 1]);
            }
          },
        );
      },
      error: (error, stackTrace) {
        return SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("데이터를 받아오는 중 오류가 발생했습니다."),
                IconButton(
                  onPressed: () {
                    controller.fetchData();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("넨도로이드 목록을 가져오는중..."),
                SizedBox(height: 20.0),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nendoroid_db/ui/_common_widget/header/header_delegate.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// 넨도 리스트 그룹의 한 덩어리
class NendoListSection extends StatelessWidget {
  const NendoListSection({
    super.key,
    required this.title,
    required this.sliverList,
  });

  final String title;
  final Widget sliverList;

  @override
  Widget build(BuildContext context) {
    // 공식 라이브러리인 SliverMainAxisGroup은 앱바가 헤더를 밀어내지 못하는 문제가 있어서 sliver_tools 라이브러리를 이용한다.
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPinnedHeader(
          child: Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            height: 50,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        sliverList,
      ],
    );

    return SliverMainAxisGroup(
      slivers: [
        const SliverPersistentHeader(
          pinned: true,
          delegate: HeaderDelegate(
            title: '고정',
          ),
        ),
        sliverList,
      ],
    );
  }
}

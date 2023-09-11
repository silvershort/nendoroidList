import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPinnedHeader(
          child: Container(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            height: 40,
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
  }
}
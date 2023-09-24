import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';

class ListNendoMemoView extends ConsumerWidget {
  const ListNendoMemoView({
    Key? key,
    required this.memo,
    this.fontSize = 11.0,
  }) : super(key: key);
  final List<String> memo;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(appSettingProvider.select((value) => value.brightness == Brightness.dark));

    return Wrap(
      spacing: 5.0,
      runSpacing: 2.5,
      children: List.generate(
        memo.length,
            (index) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
            child: Text(
              memo[index],
              style: TextStyle(fontSize: fontSize, color: isDarkMode ? Colors.black : Colors.white),
            ),
          );
        },
      ),
    );
  }
}
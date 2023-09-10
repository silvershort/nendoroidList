import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';

class ThemeColorListWidget extends ConsumerWidget {
  const ThemeColorListWidget({
    Key? key,
    required this.primarySwatches,
  }) : super(key: key);
  final List<MaterialColor> primarySwatches;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: primarySwatches.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 48,
        childAspectRatio: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            color: primarySwatches[index],
          ),
          onTap: () {
            ref.read(appSettingProvider.notifier).setAppTheme(index);
          },
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}

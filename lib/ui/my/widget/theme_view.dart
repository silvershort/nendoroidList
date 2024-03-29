import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/ui/my/widget/theme_color_list_view.dart';
import 'package:nendoroid_db/utilities/app_color.dart';

class ThemeView extends ConsumerWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appSettingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "테마 적용 : ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Switch(
              value: ref.read(appSettingProvider.notifier).isUsedDarkMode(),
              onChanged: (value) {
                ref.read(appSettingProvider.notifier).setDarkMode(value);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        const ThemeColorListView(
          primarySwatches: AppColor.themeColors,
        ),
      ],
    );
  }
}

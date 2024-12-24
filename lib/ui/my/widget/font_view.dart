import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/shared_preference_provider.dart';
import 'package:nendoroid_db/utilities/app_font.dart';

class FontView extends ConsumerWidget {
  const FontView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Wrap(
            children: AppFont.fontList.map((e) {
              return FontSelectView(
                title: e.title,
                fontType: e.fontType,
                isSelected: e.fontType == ref.watch(appSettingProvider.select((value) => value.appFont)),
                onTap: (fontType) async {
                  await ref.read(sharedPreferencesProvider).setFont(fontType);
                  ref.read(appSettingProvider.notifier).setAppFont(fontType);
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class FontSelectView extends StatelessWidget {
  const FontSelectView({
    super.key,
    required this.title,
    required this.fontType,
    required this.onTap,
    required this.isSelected,
  });

  final String title;
  final String fontType;
  final Function(String fontType) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(fontType);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Opacity(
          opacity: isSelected ? 1.0 : 0.4,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: fontType,
                ),
          ),
        ),
      ),
    );
  }
}

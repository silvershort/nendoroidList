import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/nendo_setting_sealed.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/main_sliver_app_bar_controller.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/detail_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/nendo_info_edit_dialog.dart';

class NendoGridTile extends ConsumerWidget {
  const NendoGridTile({
    super.key,
    required this.nendoData,
  });
  final NendoData nendoData;

  bool _isItemSelected(NendoListSettingState state) {
    switch (state.editMode) {
      case Have():
        if (nendoData.have) {
          return true;
        } else {
          return false;
        }
      case Wish():
        if (nendoData.wish) {
          return true;
        } else {
          return false;
        }
      case Normal():
        return false;
    }
  }

  void _showDetailDialog(BuildContext context, bool usePopup) {
    if (usePopup) {
      showDialog(
        context: context,
        builder: (context) {
          return DetailDialog(nendoData: nendoData);
        },
      );
    } else {
      context.push(RoutePath.listDetail, extra: nendoData);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoListSettingProvider);
    final nendoController = ref.read(nendoProvider.notifier);
    final bool usePopup = ref.watch(appSettingProvider.select((value) => value.usePopup));

    return GestureDetector(
      onTap: () {
        switch (state.editMode) {
          case Normal():
            _showDetailDialog(context, usePopup);
          case Have():
            nendoController.updateHaveNendo(nendoData.num);
          case Wish():
            nendoController.updateWishNendo(nendoData.num);
        }

        // 아이템 클릭했을때 포커스 해제
        if (ref.read(mainSliverAppBarControllerProvider).isSearchMode) {
          FocusScope.of(context).unfocus();
        }
      },
      onLongPress: () {
        if (_isItemSelected(state)) {
          showDialog(
            context: context,
            builder: (context) {
              return NendoInfoEditDialog(nendoData: nendoData);
            },
          );
        } else {
          _showDetailDialog(context, usePopup);
        }
      },
      child: Stack(
        children: [
          ExtendedImage.network(
            nendoData.image,
            width: double.infinity,
            fit: BoxFit.cover,
            cache: true,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                width: _isItemSelected(state) ? 5 : 0,
              ),
              color: _isItemSelected(state) ? Theme.of(context).colorScheme.secondary.withOpacity(0.2) : null,
            ),
          ),
        ],
      )
    );
  }
}
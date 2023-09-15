import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/models/edit_mode.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/list_app_bar_controller.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/detail_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/nendo_info_edit_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/icon/check_icon.dart';
import 'package:nendoroid_db/ui/_common_widget/icon/wish_icon.dart';
import 'package:nendoroid_db/utilities/extension/num_extension.dart';

class NendoGridTile extends ConsumerWidget {
  const NendoGridTile({
    Key? key,
    required this.nendoData,
  }) : super(key: key);
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

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailDialog(nendoData: nendoData);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoListSettingProvider);
    final nendoController = ref.read(nendoProvider.notifier);

    return GestureDetector(
      onTap: () {
        switch (state.editMode) {
          case Normal():
            _showDetailDialog(context);
          case Have():
            nendoController.updateHaveNendo(nendoData.num);
          case Wish():
            nendoController.updateWishNendo(nendoData.num);
        }

        // 아이템 클릭했을때 포커스 해제
        if (ref.read(listAppBarControllerProvider).isSearchMode) {
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
          _showDetailDialog(context);
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
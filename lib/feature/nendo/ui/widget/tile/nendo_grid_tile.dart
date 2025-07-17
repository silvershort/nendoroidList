import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/app/router/route_path.dart';
import 'package:nendoroid_db/feature/_common/component/text/outline_text.dart';
import 'package:nendoroid_db/feature/_common/provider/app_setting_provider.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_list_setting/grid_visible_data.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_list_setting/nendo_setting_sealed.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/dialog/detail_dialog.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/dialog/nendo_info_edit_dialog.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/main_sliver_app_bar_controller.dart';

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
      case PreOrder():
        if (nendoData.preOrder) {
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
    final gridOption = state.gridVisibleData;
    final gridCount = ref.watch(appSettingProvider.select((value) => value.gridCount));
    final itemCount = (gridCount == 0) ? MediaQuery.sizeOf(context).width ~/ 100 : gridCount;

    return GestureDetector(
      onTap: () {
        switch (state.editMode) {
          case Normal():
            _showDetailDialog(context, usePopup);
          case Have():
            nendoController.updateHaveNendo(nendoData.num);
          case Wish():
            nendoController.updateWishNendo(nendoData.num);
          case PreOrder():
            nendoController.updatePreOrderNendo(nendoData.num);
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
          if (gridOption.number || gridOption.name)
            Positioned(
              top: (8 - itemCount).clamp(1, 8).toDouble(),
              left: (8 - itemCount).clamp(1, 8).toDouble(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (gridOption.number)
                    OutlineText(
                      text: nendoData.num,
                      fontSize: (16 - itemCount).clamp(7, 16).toDouble(),
                      textColor: Colors.white,
                      outlineColor: Colors.deepOrange,
                    ),
                  if (gridOption.name)
                    OutlineText(
                      text: nendoData.name.ko ?? '',
                      fontSize: (14 - itemCount).clamp(7, 14).toDouble(),
                    ),
                ],
              ),
            ),
          if (gridOption.have || gridOption.preOrder || gridOption.wish)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (gridOption.have && nendoData.have)
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      alignment: Alignment.center,
                      child: Text(
                        '보유',
                        style: TextStyle(
                          fontSize: (14 - itemCount).clamp(7, 14).toDouble(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  if (gridOption.preOrder && nendoData.preOrder)
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      alignment: Alignment.center,
                      child: Text(
                        '예약',
                        style: TextStyle(
                          fontSize: (14 - itemCount).clamp(7, 14).toDouble(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  if (gridOption.wish && nendoData.wish)
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      alignment: Alignment.center,
                      child: Text(
                        '위시',
                        style: TextStyle(
                          fontSize: (14 - itemCount).clamp(7, 14).toDouble(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                width: _isItemSelected(state) ? 5 : 0,
              ),
              color: _isItemSelected(state) ? Colors.black45 : null,
            ),
          ),
          switch (state.editMode) {
            Normal() => switch (gridOption.emphasize) {
                NonEmphasize() => const SizedBox.shrink(),
                HaveEmphasize() => dimWidget(emphasize: const HaveEmphasize(), itemCount: itemCount),
                PreOrderEmphasize() => dimWidget(emphasize: const PreOrderEmphasize(), itemCount: itemCount),
                WishEmphasize() => dimWidget(emphasize: const WishEmphasize(), itemCount: itemCount),
              },
            Have() => const SizedBox.shrink(),
            Wish() => const SizedBox.shrink(),
            PreOrder() => const SizedBox.shrink(),
          }
        ],
      ),
    );
  }

  Widget dimWidget({
    required Emphasize emphasize,
    required int itemCount,
  }) {
    bool needEmphasize = switch (emphasize) {
      NonEmphasize() => false,
      HaveEmphasize() => nendoData.have,
      PreOrderEmphasize() => nendoData.preOrder,
      WishEmphasize() => nendoData.wish,
    };

    if (needEmphasize) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          border: Border.all(
            color: Colors.deepOrange,
            width: (7 - itemCount).clamp(0.5, 7).toDouble(),
          )
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.check,
          size: (24 - itemCount).clamp(12, 24).toDouble(),
          color: Colors.white,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

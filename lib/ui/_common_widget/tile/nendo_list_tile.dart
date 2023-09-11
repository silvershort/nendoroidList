import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class NendoListTile extends ConsumerWidget {
  const NendoListTile({
    Key? key,
    required this.nendoData,
  }) : super(key: key);
  final NendoData nendoData;

  Color _setItemSelectedColor(BuildContext context, NendoListSettingState state) {
    switch (state.editMode) {
      case Have():
        if (nendoData.have) {
          return Theme.of(context).colorScheme.secondary.withAlpha(80);
        } else {
          return Theme.of(context).colorScheme.surface;
        }
      case Wish():
        if (nendoData.wish) {
          return Theme.of(context).colorScheme.secondary.withAlpha(80);
        } else {
          return Theme.of(context).colorScheme.surface;
        }
      case Normal():
        return Theme.of(context).colorScheme.surface;
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
        _showDetailDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        width: double.infinity,
        color: _setItemSelectedColor(context, state),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ExtendedImage.network(
              nendoData.image,
              width: 100.0,
              fit: BoxFit.cover,
              cache: true,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            nendoData.num.toString(),
                            style: const TextStyle(
                              color: Colors.deepOrangeAccent,
                              height: 1.0,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Text(
                              nendoData.name.ko ?? "데이터 없음",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                height: 1.0,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: nendoData.have,
                            child: badges.Badge(
                              showBadge: nendoData.count > 1,
                              badgeStyle: const badges.BadgeStyle(
                                padding: EdgeInsets.all(3.8),
                                badgeColor: Colors.deepOrange,
                              ),
                              badgeContent: Text(
                                nendoData.count.toString(),
                                style: const TextStyle(fontSize: 10.0, color: Colors.white),
                              ),
                              position: badges.BadgePosition.bottomStart(),
                              child: const CheckIcon(),
                            ),
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Visibility(visible: nendoData.wish, child: const WishIcon()),
                        ],
                      ),
                      const SizedBox(height: 7.5),
                      Text(
                        '시리즈 : ${nendoData.series.ko ?? "데이터 없음"}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.0,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      NendoPrice(state: state, nendoData: nendoData),
                      const SizedBox(height: 7.5),
                      Text(
                        '출시날짜 : ${nendoData.releaseDate}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.0,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      Text(
                        '성별 : ${nendoData.gender ?? "데이터 없음"}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.0,
                          fontSize: 12.0,
                        ),
                      ),
                      if (nendoData.memo != null && nendoData.memo!.isNotEmpty)
                        Column(
                          children: [
                            const SizedBox(height: 7.5),
                            Offstage(
                              offstage: nendoData.memo == null,
                              child: ListNendoMemoView(memo: nendoData.memo!),
                            ),
                          ],
                        ),
                    ],
                  ),
                  Visibility(
                    visible: state.editMode is Have && nendoData.have,
                    child: Positioned(
                        bottom: -7.5,
                        right: 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return NendoInfoEditDialog(nendoData: nendoData);
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(12.5, 7.5, 12.5, 7.5),
                            minimumSize: const Size(0, 0),
                          ),
                          child: const Text(
                            '상세편집',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NendoPrice extends StatelessWidget {
  const NendoPrice({Key? key, required this.state, required this.nendoData}) : super(key: key);
  final NendoListSettingState state;
  final NendoData nendoData;

  @override
  Widget build(BuildContext context) {
    switch (state.editMode) {
      case Have():
        String purchasePrice = "";
        if (nendoData.myPrice != null && nendoData.have) {
          purchasePrice = '구매가격 : ${nendoData.myPrice.comma} 원';
        } else {
          purchasePrice = '출시가격 : ${nendoData.price.comma} 엔';
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              purchasePrice,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                height: 1.0,
                fontSize: 12.0,
              ),
            ),
          ],
        );
      case Wish():
      case Normal():
        String purchasePrice = '출시가격 : ${nendoData.price.comma} 엔';
        if (nendoData.myPrice != null && nendoData.have) {
          purchasePrice += ' | 구매가격 : ${nendoData.myPrice.comma} 원';
        }
        return Text(
          purchasePrice,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            height: 1.0,
            fontSize: 12.0,
          ),
        );
    }
  }
}

class ListNendoMemoView extends StatelessWidget {
  const ListNendoMemoView({Key? key, required this.memo, this.fontSize = 11.0}) : super(key: key);
  final List<String> memo;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 2.5,
      children: List.generate(
        memo.length,
        (index) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
            child: Text(
              memo[index],
              style: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

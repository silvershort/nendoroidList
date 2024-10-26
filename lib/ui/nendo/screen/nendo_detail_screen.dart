import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/nendo_image_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/chip/memo_list_widget.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/nendo_info_edit_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/icon/check_icon.dart';
import 'package:nendoroid_db/ui/_common_widget/icon/wish_icon.dart';
import 'package:nendoroid_db/ui/_common_widget/image_view/detail_image_slider.dart';
import 'package:nendoroid_db/utilities/extension/num_extension.dart';

class NendoDetailScreen extends ConsumerStatefulWidget {
  const NendoDetailScreen({super.key, required this.nendoData});
  final NendoData nendoData;

  @override
  ConsumerState<NendoDetailScreen> createState() => _NendoDetailScreenState();
}

class _NendoDetailScreenState extends ConsumerState<NendoDetailScreen> with SingleTickerProviderStateMixin {
  double dragPosition = 0.0;
  double opacity = 0.0;
  bool shouldPop = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            dragPosition += details.primaryDelta ?? 0;
            if (dragPosition < 0) {
              dragPosition = 0;
            }
            opacity = (dragPosition / MediaQuery.of(context).size.width).clamp(0.0, 1.0);
          });
        },
        onHorizontalDragEnd: (details) {
          if (dragPosition > MediaQuery.of(context).size.width * 0.5 ||
              (dragPosition > MediaQuery.of(context).size.width * 0.1 && details.velocity.pixelsPerSecond.dx > 300)) {
            setState(() {
              shouldPop = true;
            });
            context.pop();
          } else {
            _animation = Tween<double>(begin: dragPosition, end: 0).animate(_animationController);
            _animation.addListener(() {
              setState(() {
                dragPosition = _animation.value;
              });
            });
            _animationController.reset();
            _animationController.forward();
          }
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(
                shouldPop ? 0 : 1 - (opacity + 0.2).clamp(0.2, 1),
              ),
            ),
            Transform.translate(
              offset: Offset(dragPosition, 0),
              transformHitTests: true,
              child: Material(
                elevation: 32 * (opacity + 0.5).clamp(0.5, 1),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      '넨도로이드 상세 정보',
                    ),
                    centerTitle: true,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10.0),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 5,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer(
                                builder: (context, ref, child) {
                                  final state = ref.watch(nendoImageProvider(widget.nendoData));
                                  return state.when(
                                    data: (data) {
                                      return DetailImageSlider(
                                        imageList: data.imageList,
                                        thumbnailList: data.thumbnailList,
                                      );
                                    },
                                    error: (error, stackTrace) {
                                      return Container(
                                        height: 200,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "데이터를 불러오는데 실패했습니다.",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () => ref.refresh(nendoImageProvider(widget.nendoData)),
                                              icon: const Icon(
                                                Icons.refresh,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    loading: () {
                                      return Container(
                                        height: 200,
                                        alignment: Alignment.center,
                                        child: const CircularProgressIndicator(),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 5.0),
                              InkWell(
                                onTap: () {
                                  context.push(RoutePath.nendoWeb, extra: widget.nendoData);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.7,
                                        child: Text(
                                          "굿스마일 공식 홈페이지로 이동",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "[${widget.nendoData.num}]  ",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${widget.nendoData.name.ko}",
                                      style: DefaultTextStyle.of(context).style.copyWith(fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                "시리즈 : ${widget.nendoData.series.ko}",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "출시가격 : ${widget.nendoData.price.comma} 엔",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              Consumer(
                                builder: (context, ref, child) {
                                  final nendoList = ref.watch(nendoProvider).requireValue.filteredNendoList;
                                  final NendoData nendoData = nendoList.firstWhere((element) => element.num == widget.nendoData.num);

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (nendoData.myPrice != null)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5.0),
                                            Text(
                                              "구입가격 : ${nendoData.myPrice.comma} 원",
                                              style: const TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '출시날짜 : ${nendoData.releaseDate}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '성별 : ${nendoData.gender ?? "데이터 없음"}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      if (nendoData.have)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5.0),
                                            Text(
                                              "보유개수 : ${nendoData.count} 개",
                                              style: const TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (nendoData.memo != null)
                                        Column(
                                          children: [
                                            const SizedBox(height: 10.0),
                                            ListNendoMemoView(
                                              memo: nendoData.memo!,
                                              fontSize: 12.0,
                                            ),
                                          ],
                                        ),
                                      const SizedBox(height: 20.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              ref.read(nendoProvider.notifier).updateHaveNendo(nendoData.num);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                children: [
                                                  Opacity(
                                                    opacity: nendoData.have ? 1 : 0.5,
                                                    child: const CheckIcon(size: 15),
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Opacity(
                                                    opacity: nendoData.have ? 1 : 0.5,
                                                    child: const Text("보유"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          InkWell(
                                            onTap: () {
                                              ref.read(nendoProvider.notifier).updateWishNendo(nendoData.num);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                children: [
                                                  Opacity(
                                                    opacity: nendoData.wish ? 1 : 0.5,
                                                    child: const WishIcon(size: 15),
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Opacity(
                                                    opacity: nendoData.wish ? 1 : 0.5,
                                                    child: const Text("위시"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Offstage(
                                        offstage: !nendoData.have,
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return NendoInfoEditDialog(nendoData: nendoData);
                                                },
                                              );
                                            },
                                            child: const Text("상세편집"),
                                          ),
                                        ),
                                      ),
                                      if (nendoData.have) const SizedBox(height: 10.0),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/file_download_data.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/file_download_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/image_view/image_slider_control_widget.dart';

class DetailImageSlider extends ConsumerStatefulWidget {
  const DetailImageSlider({super.key, required this.imageList, required this.thumbnailList});

  final List<String> imageList;
  final List<String> thumbnailList;

  @override
  ConsumerState<DetailImageSlider> createState() => _DetailImageSliderState();
}

class _DetailImageSliderState extends ConsumerState<DetailImageSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ImageSliderControlWidget(
              autoPlay: ref.watch(appSettingProvider).autoPlay,
              autoPlayOnTap: (autoPlay) {
                ref.read(appSettingProvider.notifier).setAutoPlayKey(autoPlay);
              },
              downloadOnTap: () {
                ref.read(fileDownloadProvider.notifier).fileDownload(
                      fileDownloadData: FileDownloadData(
                        downloadUrl: widget.imageList[currentIndex],
                      ),
                    );
              },
              downloadOnLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CommonDialog(
                      content: '이미지 전체 다운로드를 하시겠습니까?',
                      positiveOnClick: () {
                        ref.read(fileDownloadProvider.notifier).multiFileDownload(
                          fileDownloadDataList: widget.imageList.map((e) => FileDownloadData(downloadUrl: e)).toList(),
                        );
                      },
                      negativeText: '취소',
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 5.0),
          CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: widget.imageList.length,
            itemBuilder: (context, index, pageViewIndex) {
              return InkWell(
                onTap: () async {
                  context.push(
                    '${RoutePath.imageDetail}?start=$index',
                    extra: widget.imageList,
                  );
                },
                child: ExtendedImage.network(
                  widget.imageList[index],
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              height: 180,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: ref.watch(appSettingProvider).autoPlay,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 48,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.thumbnailList.length,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    carouselController.animateToPage(index);
                  },
                  child: ExtendedImage.network(
                    widget.thumbnailList[index],
                    width: 48.0,
                    height: 48.0,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    cache: true,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 5.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

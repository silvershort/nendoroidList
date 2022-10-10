import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/image_view_page.dart';

class DetailImageSlider extends StatefulWidget {
  const DetailImageSlider({Key? key, required this.imageList, required this.thumbnailList}) : super(key: key);
  final List<String> imageList;
  final List<String> thumbnailList;

  @override
  State<DetailImageSlider> createState() => _DetailImageSliderState();
}

class _DetailImageSliderState extends State<DetailImageSlider> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: widget.imageList.length,
            itemBuilder: (context, index, pageViewIndex) {
              return InkWell(
                onTap: () {
                  Get.to(
                    ImageViewPage(
                      attachList: widget.imageList,
                      initialIndex: index,
                    ),
                  );
                },
                child: ExtendedImage.network(
                  widget.imageList[index],
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 70,
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
                    widget.imageList[index],
                    width: 70.0,
                    height: 70.0,
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

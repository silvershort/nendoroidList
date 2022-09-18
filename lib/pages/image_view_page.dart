import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({Key? key, required this.attachList, required this.initialIndex}) : super(key: key);
  final List<String> attachList;
  final int initialIndex;

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("이미지 상세보기"),
      ),
      body: Container(
        color: Colors.black,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: widget.attachList.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.attachList[index]),
              initialScale: PhotoViewComputedScale.contained * 1.0,
            );
          },
          loadingBuilder: (context, event) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          pageController: _pageController,
        ),
      ),
    );
  }
}

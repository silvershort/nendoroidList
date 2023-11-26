import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/file_download_data.dart';
import 'package:nendoroid_db/provider/file_download_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageDetailScreen extends ConsumerStatefulWidget {
  const ImageDetailScreen({super.key, required this.attachList, required this.initialIndex});

  final List<String> attachList;
  final int initialIndex;

  @override
  ConsumerState<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends ConsumerState<ImageDetailScreen> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void imageDownload() async {
    await ref.read(fileDownloadProvider.notifier).fileDownload(
      fileDownloadData: FileDownloadData(
        downloadUrl: widget.attachList[currentIndex],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("이미지 상세보기"),
        actions: [
          IconButton(
            onPressed: imageDownload,
            icon: const Icon(
              Icons.download,
            ),
          ),
        ],
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
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

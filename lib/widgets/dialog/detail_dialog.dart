import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:get/get.dart' hide Node;
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart' show parse;
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/utilities/app_font.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/utilities/url_parser.dart';
import 'package:nendoroid_db/widgets/list/detail_image_slider.dart';

import '../../models/nendo_data.dart';
import '../../pages/nendo_web_page.dart';
import '../list/list_nendo_memo_view.dart';
import 'nendo_info_edit_dialog.dart';

class DetailDialog extends StatefulWidget {
  const DetailDialog({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;

  @override
  State<DetailDialog> createState() => _DetailDialogState();
}

class _DetailDialogState extends State<DetailDialog> {
  List<String> _imageList = [];
  List<String> _thumbnailList = [];
  late Future<void> _detailFuture;
  late NendoData _nendoData;
  late final NendoController _nendoroidController;

  @override
  void initState() {
    super.initState();
    _detailFuture = getImageList();
    _nendoData = widget.nendoData;
    _nendoroidController = Get.find<NendoController>();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: FutureBuilder(
          future: _detailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError && snapshot.connectionState == ConnectionState.done) {
              return const Center(
                child: Text(
                  "데이터를 불러오는데 실패했습니다.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 15,
                  bottom: 10,
                ),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.close,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      DetailImageSlider(imageList: _imageList, thumbnailList: _thumbnailList),
                      const SizedBox(height: 5.0),
                      InkWell(
                        onTap: () {
                          Get.to(NendoWebPage(nendoData: _nendoData));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
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
                            fontFamily: AppFont.oneMobile,
                          ),
                          children: [
                            TextSpan(
                              text: "[${_nendoData.num}]  ",
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.deepOrange,
                              ),
                            ),
                            TextSpan(
                              text: "${_nendoData.name.ko}",
                              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "시리즈 : ${_nendoData.series.ko}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "출시가격 : ${IntlUtil.comma(_nendoData.price)} 엔",
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      if (_nendoroidController.getNendoData(_nendoData.num).myPrice != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5.0),
                            Text(
                              "구입가격 : ${IntlUtil.comma(_nendoroidController.getNendoData(_nendoData.num).myPrice ?? 0)} 원",
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 5.0),
                      Text(
                        '출시날짜 : ${_nendoData.releaseDate}',
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        '성별 : ${_nendoData.gender ?? "데이터 없음"}',
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      if (_nendoroidController.getNendoData(_nendoData.num).have)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5.0),
                            Text(
                              "보유개수 : ${_nendoroidController.getNendoData(_nendoData.num).count} 개",
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      if (_nendoroidController.getNendoData(_nendoData.num).memo != null)
                        Column(
                          children: [
                            const SizedBox(height: 10.0),
                            ListNendoMemoView(
                              memo: _nendoroidController.getNendoData(_nendoData.num).memo!,
                              fontSize: 15.0,
                            ),
                          ],
                        ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              _nendoroidController.updateHaveNendo(_nendoData.num);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Opacity(
                                    opacity: _nendoroidController.getNendoData(_nendoData.num).have ? 1 : 0.5,
                                    child: Icon(
                                      Icons.check,
                                      size: 15.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Opacity(
                                    opacity: _nendoroidController.getNendoData(_nendoData.num).have ? 1 : 0.5,
                                    child: const Text("보유"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              _nendoroidController.updateWishNendo(_nendoData.num);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Opacity(
                                    opacity: _nendoroidController.getNendoData(_nendoData.num).wish ? 1 : 0.5,
                                    child: const Icon(
                                      Icons.favorite,
                                      size: 15.0,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Opacity(
                                    opacity: _nendoroidController.getNendoData(_nendoData.num).wish ? 1 : 0.5,
                                    child: const Text("위시"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Offstage(
                        offstage: !_nendoroidController.getNendoData(_nendoData.num).have,
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Get.dialog(
                                NendoInfoEditDialog(nendoData: _nendoData),
                              );
                            },
                            child: const Text("상세편집"),
                          ),
                        ),
                      ),
                      if (!_nendoroidController.getNendoData(_nendoData.num).have) const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Future<void> getImageList() async {
    final String webUrl = parseNendoUrl(widget.nendoData);
    final response = await Dio().get(webUrl);
    Document document = parse(response.data);
    Element nodeList = document.getElementsByClassName("itemPhotos").first;
    _imageList = nodeList
        .getElementsByClassName("inline_fix")
        .map((e) => "https:${e.getElementsByTagName("a").firstWhere((element) => element.className == "imagebox").attributes["href"] ?? ""}")
        .toList();
    _thumbnailList = nodeList.getElementsByClassName("iconZoom").map((e) => "https:${e.attributes["src"] ?? ""}").toList();
    return Future.value();
  }
}

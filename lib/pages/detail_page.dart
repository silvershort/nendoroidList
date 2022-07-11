import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  NendoController nendoController = Get.find<NendoController>();
  WebViewController? _webViewController;
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "상세 정보"
        ),
      ),
      body: WillPopScope(
        onWillPop: () => _goBack(context),
        child: SafeArea(
          child: Scaffold(
            body: WebView(
              onWebViewCreated: (WebViewController webViewController) {
                _completer.future.then((value) => _webViewController = value);
                _completer.complete(webViewController);
              },
              // 굿스마일 공식 홈페이지를 보여주고 만약 영문이름을 받아오지 못했다면 그냥 구글검색을 해줌
              initialUrl: getUrl(widget.nendoData) ?? "http://www.google.co.kr/search?complete=1&hl=ko&q=${widget.nendoData.name.ko}",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goBack(context);
        },
        mini: true,
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  String? getUrl(NendoData nendoData) {
   if (nendoData.name.en == null) {
     return null;
   } else {
     // url 생성시 영문명에서 특수문자를 제외하고 공백을 +로 바꿔준다.
     String nendoName = widget.nendoData.name.en!
         .replaceAll(":", "")
         .replaceAll(".", "")
         .replaceAll(" ", "+");
     String url = "https://www.goodsmile.info/en/product/${widget.nendoData.gscProductNum}/Nendoroid+$nendoName.html";
     return url;
   }
  }

  // 웹뷰 뒤로가기 기능
  Future<bool> _goBack(BuildContext context) async {
    if (_webViewController == null) {
      return true;
    }

    if (await _webViewController!.canGoBack()) {
      _webViewController!.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

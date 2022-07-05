import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_list/controllers/nendo_controller.dart';
import 'package:nendoroid_list/models/nendo_data.dart';
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
          "상세 페이지"
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
     String nendoName = widget.nendoData.name.en!
         .replaceAll(":", "")
         .replaceAll(".", "")
         .replaceAll(" ", "+");
     String url = "https://www.goodsmile.info/en/product/${widget.nendoData.gscProductNum}/Nendoroid+$nendoName.html";
     return url;
   }
  }

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

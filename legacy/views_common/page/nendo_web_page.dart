import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utilities/url_parser.dart';

class NendoWebPage extends StatefulWidget {
  const NendoWebPage({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;

  @override
  State<NendoWebPage> createState() => _NendoWebPageState();
}

class _NendoWebPageState extends State<NendoWebPage> {
  NendoController nendoController = Get.find<NendoController>();
  WebViewController? _webViewController;
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },
        )
      )
      ..loadRequest(Uri.parse(parseNendoUrl(widget.nendoData)));
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
            body: WebViewWidget(controller: _webViewController!),
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

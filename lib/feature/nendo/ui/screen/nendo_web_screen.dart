import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NendoWebPage extends StatefulWidget {
  const NendoWebPage({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;

  @override
  State<NendoWebPage> createState() => _NendoWebPageState();
}

class _NendoWebPageState extends State<NendoWebPage> {
  WebViewController? _webViewController;
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();

    late final String uri;

    // 새로운 데이터일 경우
    if (widget.nendoData.image.contains('www.goodsmile.com')) {
      uri = 'https://www.goodsmile.com/en/product/${widget.nendoData.gscProductNum}';
    } // 기존 데이터일 경우
    else {
      uri = 'https://www.goodsmile.info/ja/product/${widget.nendoData.gscProductNum}';
    }

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {

            },
          )
      )
      ..loadRequest(Uri.parse(uri));
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

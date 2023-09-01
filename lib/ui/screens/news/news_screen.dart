import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("넨도로이드 소식"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '트위터 API 정책 변경 후 트위터 정보를 가져오기 어려운 상황입니다.\n다른 내용으로 소식탭 개선 예정이니 조금만 기다려주세요!'
          ),
        ),
      ),
    );
  }
}

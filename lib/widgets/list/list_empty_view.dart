import 'package:flutter/material.dart';

class ListEmptyView extends StatelessWidget {
  const ListEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      // 해당 옵션을 켜야 컨테이너의 빈화면에도 tap 이벤트가 수신됨
      behavior: HitTestBehavior.translucent,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: const Text("조건에 해당하는 넨도로이드가 없습니다."),
      ),
    );
  }
}

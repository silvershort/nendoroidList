import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    Key? key,
    this.title = "알림",
    required this.content,
    this.contentStyle,
    this.positiveText = "확인",
    this.negativeText,
    this.positiveOnClick,
    this.negativeOnClick,
  }) : super(key: key);
  final String title;
  final String content;
  final TextStyle? contentStyle;
  final String positiveText;
  final String? negativeText;
  final VoidCallback? positiveOnClick;
  final VoidCallback? negativeOnClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        content,
        style: contentStyle,
      ),
      actions: [
        if (negativeText != null)
          TextButton(
            onPressed: () {
              Get.back();
              negativeOnClick?.call();
            },
            child: Text(negativeText!),
          ),
        TextButton(
          onPressed: () {
            Get.back();
            positiveOnClick?.call();
          },
          child: Text(positiveText),
        ),
      ],
    );
  }
}

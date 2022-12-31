import 'package:flutter/material.dart';

class AccentText extends StatelessWidget {
  const AccentText({
    Key? key,
    required this.accentWord,
    required this.normalWord,
    required this.fontSize,
    this.leading = true,
  }) : super(key: key);

  final String accentWord;
  final String normalWord;
  final double fontSize;
  final bool leading;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        leading ? accentText() : normalText(),
        leading ? normalText() : accentText(),
      ]),
    );
  }

  TextSpan accentText() {
    return TextSpan(
      text: accentWord,
      style: TextStyle(
        color: Colors.deepOrangeAccent,
        fontSize: fontSize,
      ),
    );
  }
  TextSpan normalText() {
    return TextSpan(
        text: normalWord,
        style: TextStyle(
          fontSize: fontSize,
        )
    );
  }
}

import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color outlineColor;
  final double outlineWidth;
  final FontWeight fontWeight;

  const OutlineText({
    Key? key,
    required this.text,
    this.fontSize = 16.0,
    this.textColor = Colors.white,
    this.outlineColor = Colors.black,
    this.outlineWidth = 2.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Outline layer
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = outlineWidth
              ..color = outlineColor,
          ),
        ),
        // Fill layer
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
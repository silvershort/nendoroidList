import 'dart:math';

import 'package:flutter/material.dart';

class MyCollectionPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  Color textColor;
  double completePercent;
  double width;

  MyCollectionPainter({
    required this.lineColor,
    required this.completeColor,
    required this.textColor,
    required this.completePercent,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2 - paint.strokeWidth / 2, size.height / 2 - paint.strokeWidth / 2);
    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * (completePercent / 100);
    paint.color = completeColor;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paint,
    );

    drawText(canvas, size, '${completePercent.toStringAsFixed(1)}%');
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);

    TextSpan textSpan = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      text: text,
    );

    TextPainter textPaint = TextPainter(text: textSpan, textDirection: TextDirection.ltr);

    textPaint.layout();

    double dx = size.width / 2 - textPaint.width / 2;
    double dy = size.height / 2 - textPaint.height / 2;

    Offset offset = Offset(dx, dy);
    textPaint.paint(canvas, offset);
  }

  double getFontSize(Size size, String text) {
    return size.width / text.length * 0.8;
  }
}

import 'package:flutter/material.dart';

class WishIcon extends StatelessWidget {
  const WishIcon({
    super.key,
    this.size = 16,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: Colors.deepOrange,
      size: size,
    );
  }
}

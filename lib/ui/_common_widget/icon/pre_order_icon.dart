import 'package:flutter/material.dart';

class PreOrderIcon extends StatelessWidget {
  const PreOrderIcon({
    super.key,
    this.size = 16,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.alarm_outlined,
      color: Theme.of(context).colorScheme.tertiary,
      size: size,
    );
  }
}

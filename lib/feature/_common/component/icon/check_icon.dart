import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({
    super.key,
    this.size = 16,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      color: Theme.of(context).colorScheme.tertiary,
      size: size,
    );
  }
}

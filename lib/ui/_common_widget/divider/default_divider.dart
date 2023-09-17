import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 10,
      thickness: 3,
      color: Theme.of(context).colorScheme.primary.withAlpha(50),
    );
  }
}

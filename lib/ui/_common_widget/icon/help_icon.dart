import 'package:flutter/material.dart';

class HelpIcon extends StatelessWidget {
  const HelpIcon({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      radius: 24,
      child: Icon(
        Icons.help_outline,
        size: 18,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

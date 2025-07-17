import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TextRadioButton extends StatelessWidget {
  const TextRadioButton({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);
  final List<String> items;
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: items.mapIndexed((index, element) {
          return InkWell(
            onTap: () => onTap(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                element,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: index == selectedIndex ? Theme.of(context).colorScheme.primary : Colors.grey,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

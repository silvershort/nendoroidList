import 'package:flutter/material.dart';

class ListNendoMemoView extends StatelessWidget {
  const ListNendoMemoView({
    Key? key,
    required this.memo,
    this.fontSize = 11.0,
  }) : super(key: key);
  final List<String> memo;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 2.5,
      children: List.generate(
        memo.length,
            (index) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
            child: Text(
              memo[index],
              style: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MenuCountTile extends StatelessWidget {
  const MenuCountTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final int value;
  final Function(bool add) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  onChanged(false);
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          const SizedBox(width: 5.0),
          Text(
            value.toString(),
          ),
          const SizedBox(width: 5.0),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  onChanged(true);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

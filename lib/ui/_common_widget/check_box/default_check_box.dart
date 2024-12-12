import 'package:flutter/material.dart';

class DefaultCheckBox extends StatefulWidget {
  const DefaultCheckBox({
    super.key,
    required this.onChanged,
    required this.text,
    this.initialValue = false,
  });

  final Function(bool isChecked) onChanged;
  final String text;
  final bool initialValue;

  @override
  State<DefaultCheckBox> createState() => _DefaultCheckBoxState();
}

class _DefaultCheckBoxState extends State<DefaultCheckBox> {
  late bool isChecked = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: Checkbox(
              value: isChecked,
              splashRadius: 16,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
                widget.onChanged(isChecked);
              },
            ),
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}

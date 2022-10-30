import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      children: [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}

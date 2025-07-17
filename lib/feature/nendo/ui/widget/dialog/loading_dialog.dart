import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  State<LoadingDialog> createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
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
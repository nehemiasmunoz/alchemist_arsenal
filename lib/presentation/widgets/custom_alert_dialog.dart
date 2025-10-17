import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  final String title;
  final Widget content;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title, textAlign: TextAlign.center),
      content: SingleChildScrollView(child: content),
      actions: actions,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool hideText;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hideText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          obscureText: hideText,
        )
      ],
    );
  }
}

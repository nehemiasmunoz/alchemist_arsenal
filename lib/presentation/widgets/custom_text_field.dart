import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.inputType,
    required this.controller,
    this.validator,
    this.initialValue,
  });
  final String label;
  final TextInputType? inputType;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 20,
      maxLines: 1,
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
      ),
    );
  }
}

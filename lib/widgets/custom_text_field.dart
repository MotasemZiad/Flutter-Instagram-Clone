import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.isObscured = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscured;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      keyboardType: keyboardType,
      obscureText: isObscured,
    );
  }
}

import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const ReusableTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

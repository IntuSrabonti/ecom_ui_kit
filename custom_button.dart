import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onTap, child: Text(title)),
    );
  }
}

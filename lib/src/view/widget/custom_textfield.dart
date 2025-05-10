import 'package:flutter/material.dart';
import 'package:mts_app/core/color_path.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final Function()? onTap;

  const CustomTextField({
    super.key,
    this.labelText, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: const Icon(Icons.visibility),
        filled: true,
        fillColor: const Color(0xFF0D1525),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColor.blue, // Focused border color
            width: 2.0,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
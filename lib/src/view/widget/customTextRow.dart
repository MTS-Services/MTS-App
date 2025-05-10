import 'package:flutter/material.dart';

class CustomTextRow extends StatelessWidget {
  final String title;
  final String? value;

  const CustomTextRow({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        Text(
          value ?? '',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}

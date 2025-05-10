import 'package:flutter/material.dart';

class CustomDrawerIcon extends StatelessWidget {
  const CustomDrawerIcon(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      onTap: onTap,
    );
  }
}

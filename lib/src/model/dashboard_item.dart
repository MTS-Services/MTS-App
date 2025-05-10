import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final String amount;
  final Color? color;

  DashboardItem({
    required this.title,
    required this.amount,
    this.color,
  });
}

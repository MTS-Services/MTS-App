import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts_app/src/controller/theme_controller.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(() {
      final isDark = themeController.isDark.value;
      return Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF192034) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Color(0xFF1A1D2E) : Colors.grey.shade300,
              offset: Offset(3, 3),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.15),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Color(0xff9ca3af),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Color(0xff0f1729),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

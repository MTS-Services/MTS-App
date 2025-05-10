import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mts_app/core/color_path.dart';

import '../../controller/theme_controller.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final Function()? onTap;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.labelText, this.onTap, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(() {
      final isDark = themeController.isDark.value;
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 25),
        child: SizedBox(
          height: 40,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: labelText,
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: isDark ? AppColor.background : AppColor.textFieldBackgroundColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColor.loginPageBorderColor,
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:  BorderSide(
                  color: AppColor.loginPageBorderColor,
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            onTap: onTap,
          ),
        ),
      );
    });
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/color_path.dart';
import '../../controller/theme_controller.dart';
import 'custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool ischeck  = false;
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(() {
      final isDark = themeController.isDark.value;
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Enter your credentials to access your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: isDark ? Colors.white : AppColor.fontGreyColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Email',),
            const SizedBox(height: 6),
            CustomTextField(),
            const SizedBox(height: 16),
            const Text('Password',),
            const SizedBox(height: 6),
            CustomTextField(suffixIcon: Icon(Icons.remove_red_eye_outlined),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: ischeck, onChanged: (v) {
                      setState(() {
                        ischeck = v!;
                      });
                    }),
                    const Text('Remember me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    });
  }
}
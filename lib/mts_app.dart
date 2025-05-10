import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts_app/src/controller/theme_controller.dart';
import 'package:mts_app/src/view/screen/home_screen.dart';
import 'package:mts_app/src/view/screen/login_register_screen.dart';

class MtsApp extends StatelessWidget {
  MtsApp({super.key});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MTS App',
        themeMode: themeController.theme,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: const Color(0xFF0F1729),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0f1729),
            foregroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

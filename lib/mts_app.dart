import 'package:flutter/material.dart';
import 'package:mts_app/src/view/screen/home_screen.dart';
import 'package:mts_app/src/view/screen/login_register_screen.dart';


class MtsApp extends StatelessWidget {
  const MtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTS App',
      home: LoginRegisterScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
    );
  }
}

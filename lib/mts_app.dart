import 'package:flutter/material.dart';
import 'package:mts_app/src/view/screen/home_screen.dart';


class MtsApp extends StatelessWidget {
  const MtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTS App',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xFFFFFFFF),),
          bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Color(0xFF9CA3AF),)
        )
      ),
    );
  }
}

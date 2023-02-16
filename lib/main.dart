import 'package:flutter/material.dart';
import 'package:plant_app_ui/screens/screens_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      color: Colors.white,
      title: 'Plants Shop',
      home: const SplashScreen(),
    );
  }
}

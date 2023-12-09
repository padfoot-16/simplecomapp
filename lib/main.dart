import 'package:flutter/material.dart';
import 'package:simple_ecom_app/pages/intro.dart';
import 'package:simple_ecom_app/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:IntroPage(),
      theme: lightMode,
    );
  }
}
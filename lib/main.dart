import 'package:budget_tracker/views/screens/first_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme,
      home: FirstPage(),
    );
  }
}

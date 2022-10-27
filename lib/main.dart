import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';

import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      home: HomeScreen(),
    );
  }
}

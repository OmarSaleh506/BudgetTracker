import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/first_page.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:budget_tracker/views/screens/second_page.dart';
import 'package:budget_tracker/views/screens/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/theme.dart';
import '../../providers/db_provider.dart';
import 'providers/db_provider_goals.dart';
import 'views/screens/dashboardScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();

  await DatabaseProvider.initDb();
  await DatabaseProviderGoals.initDb();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: HomeScreen(),
    );
  }
}

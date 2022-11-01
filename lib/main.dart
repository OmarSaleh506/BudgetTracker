import 'package:budget_tracker/views/screens/first_page.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/theme.dart';
import '../../providers/db_provider.dart';
import 'providers/db_provider_goals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseProvider.initDb();
  await DatabaseProviderGoals.initDb();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: FirstPage(),
    );
  }
}

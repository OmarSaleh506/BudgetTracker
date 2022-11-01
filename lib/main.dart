import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'constants/theme.dart';
import '../../providers/db_provider.dart';
import 'controllers/addTransactionController.dart';
import 'models/transactionModel.dart';
import 'providers/db_provider_goals.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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



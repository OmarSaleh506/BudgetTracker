import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/dashboardScreen.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/theme.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants/categories.dart';
import '../../controllers/addTransactionController.dart';
import '../../models/transactionModel.dart';
import '../../providers/db_provider.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import 'package:fk_toggle/fk_toggle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme,
      home: AddTransaction(),
    );
  }
}


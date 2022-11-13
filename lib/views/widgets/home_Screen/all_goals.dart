import 'package:budget_tracker/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/goal_controller.dart';
import '../../screens/goal_page.dart';

class AllGoals extends StatelessWidget {
  final GoalsController _goalController = Get.put(GoalsController());
  AllGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 60.w),
      child: TextButton.icon(
        onPressed: (() async {
          await _goalController.getTransactions();
          if (_goalController.getTransactions() == null) {
            return;
          }
          Get.off(GoalPage());
        }),
        icon: Icon(Icons.chevron_left),
        label: Text('جميع الأهداف'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/goal_controller.dart';
import '../../screens/goal_page.dart';

class AllGoals extends StatelessWidget {
  final GoalsController _goalController = Get.put(GoalsController());
  AllGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 250),
      child: TextButton.icon(
        onPressed: (() async {
          await _goalController.getTransactions();
          Get.off(GoalPage());
        }),
        icon: Icon(Icons.chevron_left),
        label: Text('جميع الأهداف'),
      ),
    );
  }
}

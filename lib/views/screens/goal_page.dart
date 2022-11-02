import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/add_goal_controller.dart';
import '../widgets/home_Screen/goals.dart';
import 'edit_goals.dart';

class GoalPage extends StatelessWidget {
  GoalPage({Key? key}) : super(key: key);
  final GoalsController _GoalController = Get.find();
  final AddGoalController _addGoalController = Get.put(AddGoalController());

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      return Scaffold(
        body: ListView.builder(
          itemCount: _GoalController.myGoal.length,
          itemBuilder: (context, index) {
            final transaction = _GoalController.myGoal[index];
            return GestureDetector(
              onTap: () {
                EditGoal();
              },
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Goals(),
              ),
            );
          },
        ),
      );
    }));
  }
}

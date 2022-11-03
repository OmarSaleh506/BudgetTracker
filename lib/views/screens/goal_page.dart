import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/add_goal_controller.dart';
import '../widgets/home_Screen/goals.dart';
import 'edit_goals.dart';

class GoalPage extends StatelessWidget {
  GoalPage({Key? key}) : super(key: key);
  final AddGoalController _addGoalController = Get.put(AddGoalController());
  final GoalsController _goalController = Get.find<GoalsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            'أهدافك',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              letterSpacing: 2,
            ),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _goalController.myGoal.length,
          itemBuilder: (context, index) {
            final data = _goalController.myGoal[index];
            return GestureDetector(
                onTap: () {
                  EditGoal();
                },
                child: Goals(
                  goalModel: data,
                ));
          },
        )
      ]),
    ));
  }
}

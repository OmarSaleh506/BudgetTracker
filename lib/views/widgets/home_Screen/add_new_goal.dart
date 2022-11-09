import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/add_goal_controller.dart';
import '../../screens/add_goals.dart';

class AddNewGoal extends StatelessWidget {
  AddNewGoal({
    Key? key,
  }) : super(key: key);
  // final GoalsController _goalController = Get.put(GoalsController());

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        // await _goalController.getTransactions();
        Get.bottomSheet(Card(
          child: Container(height: 516, child: AddGoals()),
        ));
      },
      label: Text(
        'أضف هدف',
        style: TextStyle(
          fontSize: 14,
          color: Color(0xff797979),
          fontWeight: FontWeight.w700,
        ),
      ),
      icon: Icon(
        Icons.add,
        size: 19,
        color: Color(0xff797979),
      ),
    );
  }
}
//  Scaffold.of(context).showBottomSheet<void>(((BuildContext context) {
//           return Card(
//             child: Container(height: 516, child: AddGoals()),
//           );
//         }));
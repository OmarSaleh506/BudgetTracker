import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/goal_controller.dart';
import '../../screens/add_goals.dart';

class AddNewGoal extends StatelessWidget {
  AddNewGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
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

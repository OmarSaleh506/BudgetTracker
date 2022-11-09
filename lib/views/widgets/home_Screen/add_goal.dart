import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/add_goals.dart';
import 'package:budget_tracker/views/screens/goal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/add_goal_controller.dart';

class AddGoal extends StatelessWidget {
  const AddGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              AddNewTransaction(),
            ],
          ),
        ),
      ],
    );
  }
}

class AddNewTransaction extends StatelessWidget {
  const AddNewTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 280, bottom: 50),
      child: SizedBox(
        width: 84,
        height: 84,
        child: FloatingActionButton.large(
          onPressed: () {
            Get.to(AddTransaction());
          },
          child: const Icon(
            Icons.add,
            color: lightModeScaffoldBgCle,
            size: 35,
          ),
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}

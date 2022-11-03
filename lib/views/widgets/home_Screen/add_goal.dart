import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/add_goals.dart';
import 'package:budget_tracker/views/screens/goal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

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
              TextButton.icon(
                onPressed: () {
                  Scaffold.of(context)
                      .showBottomSheet<void>(((BuildContext context) {
                    return Card(
                        child: Container(height: 516, child: AddGoals()));
                  }));
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250),
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
              ),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: (() {
                        Get.to(GoalPage());
                      }),
                      icon: Icon(Icons.chevron_left),
                      label: Text('جميع الأهداف'))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

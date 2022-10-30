import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/add_goals.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: TextButton.icon(
            onPressed: () {
              Scaffold.of(context)
                  .showBottomSheet<void>(((BuildContext context) {
                return Card(child: Container(height: 570, child: AddGoals()));
              }));
            },
            icon: Icon(
              Icons.add,
              size: 19,
              color: Color(0xff797979),
            ),
            label: Text(
              'Add Goal',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff797979),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: FloatingActionButton(
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
        )
      ],
    );
  }
}

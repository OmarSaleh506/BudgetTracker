import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
        Scaffold.of(context).showBottomSheet<void>(
          ((BuildContext context) {
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1.w),
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Card(
                  child: AddGoals(),
                ),
              ),
            );
          }),
        );
      },
      label: Text(
        'أضف هدف',
        style: TextStyle(
          fontSize: 10.sp,
          color: Color(0xff797979),
          fontWeight: FontWeight.w700,
        ),
      ),
      icon: Icon(
        Icons.add,
        size: 14.sp,
        color: Color(0xff797979),
      ),
    );
  }
}

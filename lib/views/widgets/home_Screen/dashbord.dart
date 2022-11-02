import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/add_goal_controller.dart';
import '../../../controllers/home_controlle.dart';

class DashBord extends StatelessWidget {
  DashBord({
    Key? key,
  }) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());
  final GoalsController _goalsController = Get.put(GoalsController());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightModeScaffoldBgCle,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 170,
        width: 327,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(180, 0, 0, 0),
              child: Text(
                'إجمالي الرصيد',
                style: TextStyle(
                    color: detailColor, fontSize: 14, letterSpacing: 1),
              ),
            ),
            Obx(() => Text(
                  "SAR ${_homeController.totalBalance.value.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 3),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
              child: Text(
                "أدخرت",
                style: TextStyle(
                    color: detailColor, fontSize: 14, letterSpacing: 3),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Obx(
                () => Text(
                    'SAR ${_goalsController.totalSaved.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 3,
                        color: primaryColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

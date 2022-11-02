import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/home_controlle.dart';

class CurrentOverview extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 163,
            height: 73,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.call_made,
                          color: primaryColor,
                        ),
                        Text(
                          'دخلك',
                          style: TextStyle(
                              color: detailColor,
                              fontSize: 12,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => Text(
                        ' ${_homeController.totalIncome.value} SR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 3,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 163,
            height: 73,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.call_received,
                          color: expenseColor,
                        ),
                        Text(
                          'صرفك',
                          style: TextStyle(
                              color: detailColor,
                              fontSize: 12,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => Text(
                        ' ${_homeController.totalExpense.value} SR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 3,
                            color: expenseColor),
                      )),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

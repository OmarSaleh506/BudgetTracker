import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
            side: BorderSide(color: Colors.white70, width: 1.w),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: Container(
            width: 40.w,
            height: 8.5.h,
            child: Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                            fontSize: 10.sp,
                            letterSpacing: 0.1.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (_homeController.myTransactions.isEmpty) {
                      return Text(
                        "0.0 SR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          letterSpacing: 0.7.w,
                        ),
                      );
                    } else {
                      return Text(
                        ' ${_homeController.totalIncome.value} SR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          letterSpacing: 0.7.w,
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white70,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: Container(
            width: 40.w,
            height: 8.5.h,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                            fontSize: 10.sp,
                            letterSpacing: 0.1.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (_homeController.myTransactions.isEmpty) {
                      return Text(
                        "0.0 SR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          letterSpacing: 0.7.w,
                          color: Colors.red
                        ),
                      );
                    } else {
                      return Text(
                        ' ${_homeController.totalExpense.value} SR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          letterSpacing: 0.7.w,
                            color: Colors.red
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

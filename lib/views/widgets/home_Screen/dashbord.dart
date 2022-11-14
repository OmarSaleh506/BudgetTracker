import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../controllers/goal_controller.dart';
import '../../../controllers/home_controlle.dart';

class DashBord extends StatelessWidget {
  DashBord({
    Key? key,
  }) : super(key: key);

  final HomeController _homeController = Get.find();
  final GoalsController _goalsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightModeScaffoldBgCle,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white12,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: SizedBox(
        height: 21.h,
        width: 80.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(38.w, 0.h, 0.w, 0.h),
              child: Text(
                'إجمالي الرصيد',
                style: TextStyle(
                  color: detailColor,
                  fontSize: 12.sp,
                  letterSpacing: 0.1.w,
                ),
              ),
            ),
            Obx(() {
              if(_homeController.myTransactions.isEmpty) {
                return  Text("0.00 SR" ,style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  letterSpacing: 1.1.w,),);
              } else{ return Text(
                "${_homeController.totalBalance.value.toStringAsFixed(2)} SR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  letterSpacing: 1.1.w,
                ),
              );}}),
            Padding(
              padding: EdgeInsets.fromLTRB(54.w, 0.h, 0.w, 0.h),
              child: Text(
                "أدخرت",
                style: TextStyle(
                  color: detailColor,
                  fontSize: 12.sp,
                  letterSpacing: 0.1.w,
                ),
              ),
            ),
            Obx(
              () =>
                  Text(' ${_goalsController.totalSaved.toStringAsFixed(2)} SR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        letterSpacing: 0.8.w,
                        color: primaryColor,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

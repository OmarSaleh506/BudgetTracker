import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../routes/routes.dart';
import '../../screens/addTransaction.dart';

class AddNewTransaction extends StatelessWidget {
  const AddNewTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w, bottom: 10.h),
      child: SizedBox(
        width: 22.w,
        height: 14.h,
        child: FloatingActionButton.large(
          onPressed: () {
            Get.offNamed(Routes.addTransaction);
          },
          child: Icon(
            Icons.add,
            color: lightModeScaffoldBgCle,
            size: 30.sp,
          ),
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}

import 'package:budget_tracker/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
        ),
      );
    });
  }
}

AppBar _appBar() {
  return AppBar(
    toolbarHeight: 50,
    backgroundColor: primaryColor,
    leading: const Text('Welcome'),
    actions: [
      IconButton(
        onPressed: () => Get.to(() => ''),
        icon: Icon(
          Icons.bar_chart,
          size: 27.sp,
          color: lightModeScaffoldBgCle,
        ),
      ),
      IconButton(
        onPressed: () => Get.to(() => ''),
        icon: Icon(
          Icons.notification_add_outlined,
          size: 27.sp,
          color: lightModeScaffoldBgCle,
        ),
      ),
    ],
  );
}

import 'package:budget_tracker/views/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [
              SizedBox(
                height: 5.1.h,
              ),
              Container(
                  height: 37.h,
                  width: 73.w,
                  child: Image(image: AssetImage('images/first.png'))),
              SizedBox(
                height: 0.2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'حدد اهدافك المالية',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                ),
              ),
              SizedBox(
                height: 1.6.h,
              ),
              Container(
                width: 65.8.w,
                height: 9.h,
                child: Text(
                  "ماعليك سوى إظافة جميع اهدافك المالية التي توجهك نحو احلامك يمكنك ان ترى الى اي مدى وصلت وماهي المعالم المتبقية لك لتحقق النجاح!",
                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(61.w, 25.6.h, 0.w, 0.h),
                child: Stack(
                  children: [
                    Image(image: AssetImage('images/Blob.png')),
                    Positioned(
                      left: 22.w,
                      top: 6.h,
                      child: TextButton(
                        onPressed: () {
                          Get.to(SecondPage());
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: lightModeScaffoldBgCle,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

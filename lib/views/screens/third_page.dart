import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../routes/routes.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Image(image: AssetImage('images/third.png')),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Text(
                  'مخطط التمويل',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 60.w,
                height: 5.h,
                child: Text(
                  "تعرف على وضعك المالي بناءً على المعلومات المنظمة من حساباتك المصرفية",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(65.1.w, 8.h, 0, 0),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(
                        'images/Blob-3.png',
                      ),
                    ),
                    Positioned(
                      left: 19.w,
                      top: 16.h,
                      child: TextButton(
                          onPressed: () async {
                            Get.offNamed(Routes.homeScreen);
                          },
                          child: Text(
                            'أبدأ',
                            style: TextStyle(
                              color: lightModeScaffoldBgCle,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
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

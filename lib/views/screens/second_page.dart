import 'package:budget_tracker/views/screens/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 7.h,
              ),
              Image(image: AssetImage('images/second.png')),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'شاهد الصورة الأكبر لأموالك',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 70.w,
                height: 7.h,
                child: Text(
                  "احصل على رؤية واضحة لأموالك. مع تقارير ورؤى سهلة القراءة يمكنك رؤية درجة الائتمان وارصدة الحسابات والأنفاق والمزيد- كل ذالك في مكان واحد",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(41.w, 6.5.h, 0.w, 0.h),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('images/Blob-2.png'),
                    ),
                    Positioned(
                      left: 44.w,
                      top: 18.h,
                      child: TextButton(
                        onPressed: () {
                          Get.off(ThirdPage());
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

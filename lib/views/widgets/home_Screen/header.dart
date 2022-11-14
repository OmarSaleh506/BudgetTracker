import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "images/logo.svg",
              width: 10.w,
              height: 6.h,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'مرحباًبك',
                    style: TextStyle(
                      color: lightModeScaffoldBgCle,
                      fontWeight: FontWeight.w400,
                      letterSpacing:0.3.w,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                  Text(
                    'تابع وجدول فواتيرك',
                    style: TextStyle(
                      color: lightModeScaffoldBgCle,
                      letterSpacing: 0.3.w,
                      fontSize: 10.sp,
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

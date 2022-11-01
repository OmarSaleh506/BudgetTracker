import 'package:budget_tracker/views/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 183,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("images/logo.svg"),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'مرحباًبك',
                      style: TextStyle(
                          color: lightModeScaffoldBgCle,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'تابع وجدول فواتيرك',
                      style: TextStyle(
                          color: lightModeScaffoldBgCle,
                          letterSpacing: 1,
                          fontSize: 14),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

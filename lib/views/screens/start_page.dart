import 'package:budget_tracker/constants/colors.dart';
import 'package:budget_tracker/views/screens/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:get/get.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Get.off(FirstPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 73.8,
              height: 79.95,
              child: SvgPicture.asset(
                'images/logo.svg',
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'وفير',
              style: TextStyle(color: primaryColor, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}

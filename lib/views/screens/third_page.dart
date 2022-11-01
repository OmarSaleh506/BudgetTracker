import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 67,
            ),
            Image(image: AssetImage('images/third.png')),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 140),
              child: const Text(
                'مخطط التمويل',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 283,
              height: 84,
              child: Text(
                "تعرف على وضعك المالي بناءً على المعلومات المنظمة من حساباتك المصرفية",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(280, 37, 0, 0),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(
                      'images/Blob-3.png',
                    ),
                    width: 150,
                  ),
                  Positioned(
                    left: 80,
                    top: 140,
                    child: TextButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        child: Text(
                          'أبدأ',
                          style: TextStyle(
                              color: lightModeScaffoldBgCle,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

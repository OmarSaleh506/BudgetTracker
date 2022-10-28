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
            const SizedBox(
              height: 70,
            ),
            Image(image: AssetImage('images/third.png')),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 146),
              child: const Text(
                'Finance Planner',
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
                "See how you`re financially situated depeniding on curated information from your bank accounts.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(260, 40, 0, 0),
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
                          'Start',
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

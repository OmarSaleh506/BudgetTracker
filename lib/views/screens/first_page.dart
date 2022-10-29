import 'package:budget_tracker/views/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             SizedBox(
              height: 67,
            ),
            Image(image: AssetImage('images/first.png')),
             SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 85),
              child:  Text(
                'Set Your Financial Goals',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
            ),
             SizedBox(
              height: 15,
            ),
            Container(
              width: 283,
              height: 84,
              child: Text(
                'Simply add all of the financial goals that steer you`ve toward your dreams. You can see how far you`ve come and what milestones are lift for you ti succeed!',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(120, 62, 0, 0),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('images/Blob.png'),
                  ),
                  Positioned(
                    left: 220,
                    top: 180,
                    child: TextButton(
                      onPressed: () {
                        Get.to(SecondPage());
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: lightModeScaffoldBgCle,
                        size: 35,
                      ),
                    ),
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
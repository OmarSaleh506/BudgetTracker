import 'package:budget_tracker/views/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 67,
            ),
            Image(image: AssetImage('images/first.png')),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Text(
                'حدد اهدافك المالية',
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
                "ماعليك سوى إظافة جميع اهدافك المالية التي توجهك نحو احلامك يمكنك ان ترى الى اي مدى وصلت وماهي المعالم المتبقية لك لتحقق النجاح!",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(140, 65, 0, 0),
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
                        Get.off(SecondPage());
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

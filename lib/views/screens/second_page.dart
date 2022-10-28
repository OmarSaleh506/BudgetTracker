import 'package:budget_tracker/views/screens/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image(image: AssetImage('images/second.png')),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Set The Bigger Picture of Your Money',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 283,
              height: 84,
              child: Text(
                "Get a clear view fo your finances, with easy-to-read summarise and insights. You can see your cridit score, account balances,spending, and more - all in one place",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 43, 0, 0),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('images/Blob-2.png'),
                  ),
                  Positioned(
                    left: 180,
                    top: 180,
                    child: TextButton(
                      onPressed: () {
                        Get.to(ThirdPage());
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

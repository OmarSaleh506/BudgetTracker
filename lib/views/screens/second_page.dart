import 'package:budget_tracker/views/screens/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 63,
            ),
            Image(image: AssetImage('images/second.png')),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'شاهد الصورة الأكبر لأموالك',
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
                "احصل على رؤية واضحة لأموالك. مع تقارير ورؤى سهلة القراءة يمكنك رؤية درجة الائتمان وارصدة الحسابات والأنفاق والمزيد- كل ذالك في مكان واحد",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(175, 40, 0, 0),
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
                        Get.off(ThirdPage());
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

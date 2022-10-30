import 'package:budget_tracker/views/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: lightModeScaffoldBgCle,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                        fontSize: 20),
                  ),
                  Text(
                    'Wednesday, Oct 26',
                    style: TextStyle(
                        color: lightModeScaffoldBgCle,
                        letterSpacing: 1,
                        fontSize: 10),
                  ),
                ]),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(DashboardScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.asset('images/chart.png'),
                  ),
                ),
                TextButton(
                  child: Image.asset('images/Vector.png'),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
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
                IconButton(
                  color: lightModeScaffoldBgCle,
                  iconSize: 45,
                  onPressed: () {
                    Get.to(DashboardScreen());
                  },
                  icon: const Icon(Icons.bar_chart),
                ),
                IconButton(
                  color: lightModeScaffoldBgCle,
                  iconSize: 25,
                  icon: const Icon(Icons.add_alert),
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

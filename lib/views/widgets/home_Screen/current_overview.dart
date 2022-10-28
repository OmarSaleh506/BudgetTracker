import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CurrentOverview extends StatelessWidget {
  const CurrentOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Container(
            width: 163,
            height: 73,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Income',
                    style: TextStyle(
                        color: detailColor, fontSize: 12, letterSpacing: 1),
                  ),
                  Text(
                    'SAR 3,050',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 3),
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            width: 163,
            height: 73,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Spindling',
                    style: TextStyle(
                        color: detailColor, fontSize: 12, letterSpacing: 1),
                  ),
                  Text(
                    'SAR 550.23',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 3,color: expenseColor),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

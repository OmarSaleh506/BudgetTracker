import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Budget extends StatelessWidget {
  const Budget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Budget',
          style: TextStyle(
              color: detailColor, fontWeight: FontWeight.w700, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 357,
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Budget Left',
                    style: TextStyle(
                      color: detailColor,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'SAR 250.0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 3),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Of 3,000',
                          style:
                              TextStyle(color: detailColor, letterSpacing: 1))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffFF5678),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        width: 74,
                        height: 12,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(0.0),
                            bottomLeft: Radius.circular(00.0),
                          ),
                        ),
                        width: 133,
                        height: 12,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(00.0),
                            bottomLeft: Radius.circular(0.0),
                          ),
                        ),
                        width: 80,
                        height: 12,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffFF5678),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              width: 7,
                              height: 7,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Spending',
                              style: TextStyle(
                                  color: detailColor, letterSpacing: 1),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              width: 7,
                              height: 7,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Saving',
                              style: TextStyle(
                                  color: detailColor, letterSpacing: 1),
                            )
                          ],
                        ),
                      ],
                    ),
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

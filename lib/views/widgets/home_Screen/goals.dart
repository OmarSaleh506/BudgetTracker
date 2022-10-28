import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Goals extends StatelessWidget {
  const Goals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Goals',
          style: TextStyle(
              color: detailColor, fontWeight: FontWeight.w700, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: Container(
            width: 354,
            height: 144,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('New House',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              letterSpacing: 3)),
                      Container(
                        width: 98,
                        height: 41,
                        decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '% 12',
                              style: TextStyle(color: detailColor),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff1C6DD0),
                                child: Icon(
                                  Icons.house,
                                  size: 36.0,
                                  color: lightModeScaffoldBgCle,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dec 10 , 2032',
                        style: TextStyle(color: detailColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff1C6DD0),
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
                              color: Color(0xffEEEEEE),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(00.0),
                                bottomLeft: Radius.circular(0.0),
                              ),
                            ),
                            width: 213,
                            height: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SAR 17,000 / 310.000',
                            style: TextStyle(
                                color: detailColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'SAR 253,000 Lift',
                            style: TextStyle(
                                color: detailColor,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
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

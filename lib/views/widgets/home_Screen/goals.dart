import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/add_goal_controller.dart';

class Goals extends StatelessWidget {
  Goals({
    Key? key,
  }) : super(key: key);
  final GoalsController _goalController = Get.put(GoalsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'أهداف',
          style: TextStyle(
            color: detailColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            letterSpacing: 2,
          ),
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
            height: 172,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                              style: TextStyle(
                                  color: detailColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ), //'lib/constants/goalsIcons/house.svg'
                            Expanded(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff1C6DD0),
                                child: SvgPicture.asset(
                                    'lib/constants/goalsIcons/house.svg'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'بيت',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
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
                            width: 240,
                            height: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            (() => Text(
                                  '${_goalController.totalSaved.value} / ${_goalController.totalGoalAmount.value} ريال',
                                  style: TextStyle(
                                      color: detailColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                          Obx(
                            () => Text(
                              'الباقي ${_goalController.totalGoalAmountLeft.value} ريال',
                              style: TextStyle(
                                color: detailColor,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
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

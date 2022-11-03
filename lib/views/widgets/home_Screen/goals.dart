import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/addTrans_goal_controller.dart';
import '../../../controllers/add_goal_controller.dart';
import '../../../models/goalModel.dart';

class Goals extends StatelessWidget {
  final GoalModel goalModel;
  Goals({Key? key, required this.goalModel}) : super(key: key);

  final GoalsController _goalController = Get.find();
  final AddGoalController _addGoalController = Get.put(AddGoalController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            print('gg');
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 357,
              height: 172,
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
                              ),
                              Obx(
                                (() => Expanded(
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color(0xff1C6DD0),
                                        child: SvgPicture.asset(
                                          "${goalModel.image}",
                                        ),
                                      ),
                                    )),
                              ),
                            ]),
                      ),
                      Obx((() => Text(
                            '${goalModel.category}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              letterSpacing: 3,
                            ),
                          )))
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
                                  '${goalModel.savedAmount} / ${goalModel.goalAmount}  ريال',
                                  style: TextStyle(
                                      color: detailColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                          Obx(
                            () => Text(
                              'الباقي ${goalModel.goalAmountLeft} SR',
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

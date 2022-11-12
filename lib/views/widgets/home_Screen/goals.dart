import 'dart:math';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/colors.dart';
import '../../../models/goalModel.dart';

class Goals extends StatelessWidget {
  final GoalModel? goalModel;
  Goals({Key? key, this.goalModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double amountLft = double.parse(goalModel!.goalAmount!) -
        double.parse(goalModel!.savedAmount!);
    ColorParser parser;
    parser = ColorParser.value(int.parse(goalModel!.color!));
    Color? color = parser.getColor();
    double? goalPrecent = double.parse(goalModel!.savedAmount!) /
        double.parse(goalModel!.goalAmount!);

    double roundDouble(double value, int places) {
      num mod = pow(10.0, places);

      return ((value * mod).round().toDouble() / mod);
    }

    var percentRound = roundDouble(goalPrecent, 1) * 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 1.2.h,
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1.w),
            borderRadius: BorderRadius.circular(4.w),
          ),
          child: Container(
            width: 85.w,
            height: 19.h,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 23.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.w),
                            bottomRight: Radius.circular(10.w),
                            topLeft: Radius.circular(10.w),
                            bottomLeft: Radius.circular(10.w),
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '% $percentRound ',
                                style: TextStyle(
                                  color: detailColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  radius: 4.w,
                                  backgroundColor: color,
                                  child: SvgPicture.asset(
                                    "${goalModel!.image!}",
                                    color: lightModeScaffoldBgCle,
                                  ),
                                ),
                              )
                            ]),
                      ),
                      Text(
                        '${goalModel!.category}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                          letterSpacing: 1.w,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      LinearPercentIndicator(
                        width: 76.w,
                        lineHeight: 1.5.h,
                        percent: roundDouble(goalPrecent, 1),
                        progressColor: color,
                        barRadius: Radius.circular(1.5.w),
                        animation: true,
                        animationDuration: 1000,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${goalModel!.savedAmount} / ${goalModel!.goalAmount} SR',
                            style: TextStyle(
                              color: detailColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'الباقي ${amountLft} SR',
                            style: TextStyle(
                              color: detailColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3.w,
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
        ),
      ],
    );
  }
}

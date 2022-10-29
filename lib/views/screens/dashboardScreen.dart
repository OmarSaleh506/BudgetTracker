import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:intl/intl.dart';
import '../widgets/chartIndicator.dart';
import '../widgets/transaction.dart';
import 'file.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int touchedIndex=1;
    return Scaffold(
        appBar: AppBar(title: Text("Dashboard",), backgroundColor: Colors.transparent, elevation: 0,),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 50.0,
                  height: 300.0,
                  child: PieChart(
                      PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                      (context as Element).markNeedsBuild();
                    }
                    ),
                    centerSpaceRadius: 0,
                    sectionsSpace: 2,
                    sections: getSection(touchedIndex),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: IndicatorsWidget(),
                  ),
                ],
              ),

    Expanded(
      child: Column(
      children: [
      const SizedBox(
      height: 30,
      ),
      Padding(
      padding: EdgeInsets.all(10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  const [
      Text(
      "Recent Transactions",
      style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: detailColor,letterSpacing: 0.5,
      ),),
      Text(
      "View Detail",
      style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: detailColor,letterSpacing: 0.5,
      decoration: TextDecoration.underline),
      )
      ],
      ),

      ),
        Container(

          child: TransactionWidget(),)
      ]),
    ),




            ]));
  }
}

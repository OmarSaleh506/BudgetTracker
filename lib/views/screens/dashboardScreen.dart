import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:intl/intl.dart';
import '../../controllers/home_controlle.dart';
import '../widgets/chartIndicator.dart';
import '../widgets/transaction.dart';
import 'file.dart';

class DashboardScreen extends StatelessWidget {


  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print("this is ${_homeController.myTransactions.length}");
    int touchedIndex=1;
    return Scaffold(
        appBar: AppBar(title: Text("Dashboard",), backgroundColor: Colors.transparent, elevation: 0,),
        body: ListView(

            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 50.0,
                  height: 300.0,
                  child:
                  PieChart(
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

    Container(
      child: Column(
      children: [
      const SizedBox(
      height: 30,
      ),
      Padding(
      padding: EdgeInsets.all(10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  const [
      Text(
      "Recent Transactions",
      style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: detailColor,letterSpacing: 0.5,
      ),),
      // Text(
      // "View Detail",
      // style: TextStyle(
      // fontSize: 10,
      // fontWeight: FontWeight.w400,
      // color: detailColor,letterSpacing: 0.5,
      // decoration: TextDecoration.underline),
      // )
      ],
      ),

      ),
        Container(
          child: _homeController.myTransactions.length == 0?Text("No Transactions to show."): //show message if there is no any student
          Column(  //or populate list to Column children if there is student data.
            children: _homeController.myTransactions.map((transaction){
              final text = transaction.amount;
              final bool isIncome = transaction.type == 'Income' ? true : false;
              final formatAmount = isIncome ? '+ $text' : '- $text';
              return TransactionWidget(transactionModel: transaction,
              formatAmount: formatAmount,
              isIncome: isIncome,);
            }).toList(),
          ),
        ),
      ]),

      
    ),




            ]));
  }
}

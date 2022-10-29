
import 'package:budget_tracker/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:intl/intl.dart';
import '../../controllers/home_controlle.dart';
import '../widgets/chartIndicator.dart';
import '../widgets/transaction.dart';
import 'file.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardScreen extends StatelessWidget {


  final HomeController _homeController = Get.put(HomeController());






  // double totalSum (int listId){
  //   return _homeController.myTransactions.where((element) => element.amount== listId).fold(0.0, (previousValue, element) => previousValue + element.amount);
  // }


  Map<String, double> dataMap = {
    "Health & Care": 18.47,
    "Transportation": 17.70,
    "Internet": 4.25,
    "Grocery": 3.51,
    "Other": 2.83,
  };

  List<Color> colorList = [
    const Color(0xff1E9984),
    const Color(0xff63C3B3),
    const Color(0xff268AFF),
    const Color(0xffFA4A42),
    const Color(0xffFF5678)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    print("this is ${_homeController.myTransactions.length}");

    int touchedIndex=1;
    return Obx(() => Scaffold(
        appBar: AppBar(title: Text("Reoprt",), backgroundColor: Colors.transparent, elevation: 0,),
        body: ListView(

            children: <Widget>[
              SizedBox(height: 30,),
              Center(
                  child:
                  PieChart(
                    dataMap:dataMap,
                    colorList:colorList,
                    chartRadius: MediaQuery.of(context).size.width /2,
                    centerText: "${_homeController.totalExpense.value} SR \n Total" ,
                    centerTextStyle: TextStyle(fontSize: 25, color: textColor,),
                    ringStrokeWidth: 27,
                    animationDuration: const Duration(seconds: 3),
                    chartType: ChartType.ring,
                    chartValuesOptions: const ChartValuesOptions(
                        showChartValues: true,
                        showChartValuesOutside: true,
                        showChartValuesInPercentage: true,
                        showChartValueBackground: false
                    ),
                    legendOptions: const LegendOptions(
                        showLegends: true,
                        legendShape: BoxShape.rectangle,
                        legendTextStyle: TextStyle(fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w400,),
                      legendPosition: LegendPosition.bottom,

                    ),

                  ),
                  // PieChart(
                  //     PieChartData(
                  //   pieTouchData: PieTouchData(
                  //       touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  //     if (!event.isInterestedForInteractions ||
                  //         pieTouchResponse == null ||
                  //         pieTouchResponse.touchedSection == null) {
                  //       touchedIndex = -1;
                  //       return;
                  //     }
                  //     touchedIndex =
                  //         pieTouchResponse.touchedSection!.touchedSectionIndex;
                  //     (context as Element).markNeedsBuild();
                  //   }
                  //   ),
                  //   centerSpaceRadius: 0,
                  //   sectionsSpace: 2,
                  //   sections: getSection(touchedIndex),
                  // )),

              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Padding(
              //       padding: EdgeInsets.all(1),
              //       child: IndicatorsWidget(),
              //     ),
              //   ],
              // ),

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
                                color: Colors.black ,letterSpacing: 0.5,
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




            ]))) ;
  }
}

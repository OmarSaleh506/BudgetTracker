
import 'package:budget_tracker/controllers/chart_controller.dart';
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
  final ChartController _chartController=Get.put(ChartController());


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
    print("internet ${ _chartController.totalInternts}");
    print("Health ${ _chartController.totalHealth}");

    Map<String, double> dataMap = {
      "Health & Care": _chartController.totalHealth.value,
      "Transportation": _chartController.totaltrans.value,
      "Internet": _chartController.totalInternts.value,
      "Grocery": _chartController.totalgrocery.value,
      "Other": _chartController.totalother.value,
    };


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
                        child: _homeController.myTransactions.length == 0?Text("No Transactions to show."): //show message if there is no any transaction
                        Column(  //or populate list to Column children if there is transaction data.
                          children:

                          _homeController.myTransactions.map((transaction){
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
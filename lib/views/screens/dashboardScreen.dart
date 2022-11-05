
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

class DashboardScreen extends GetView {


  final ChartController _chartController=Get.put(ChartController());
  final HomeController _homeController = Get.find<HomeController>();


  List<Color> colorList = [
    warningColor,
    darkBlueColor,
    lightBlueColor,
    purpleColor,
    lightpinkColor
  ];



  @override
  Widget build(BuildContext context) {
    print("this is ${_homeController.myTransactions.length}");
    print("other ${ _chartController.totalother}");
    print("Health ${ _chartController.totalHealth}");

    Map<String, double> dataMap = {
      "الصحة": _chartController.totalHealth.value,
      "النقل": _chartController.totaltrans.value,
      "سفر": _chartController.totalInternts.value,
      "مقاضي": _chartController.totalgrocery.value,
      "أخرى": _chartController.totalother.value,
    }.obs;


    int touchedIndex=1;
    return Obx(() => Scaffold(
        appBar: AppBar(title: Text("وضعك المالي",), backgroundColor: Colors.transparent, elevation: 0,),
        body: ListView(

            children: <Widget>[
              SizedBox(height: 30,),
              Center(
                  child:
                  PieChart(
                    dataMap:dataMap,
                    colorList:colorList,
                    chartRadius: MediaQuery.of(context).size.width /2,
                    centerText: "${_homeController.totalExpense.value} SR \n مجموع المصاريف" ,
                    centerTextStyle: TextStyle(fontSize: 25, color: textColor,),
                    ringStrokeWidth: 27,
                    animationDuration: const Duration(seconds: 3),
                    chartType: ChartType.ring,
                    chartValuesOptions:  ChartValuesOptions(
                      showChartValues: true,
                        showChartValuesInPercentage: true,

                        showChartValuesOutside: true,
                        showChartValueBackground: false,
                    ),
                    legendOptions:  LegendOptions(
                        showLegends: true,
                        legendShape:BoxShape.rectangle,
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
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  const [
                            Text(
                              "آخر العمليات",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: detailColor ,letterSpacing: 0.5,
                              ),),

                          ],
                        ),

                      ),
                      Container(
                        child: _homeController.myTransactions.length == 0?Text("لا توجد عمليات لعرضها",style: TextStyle(fontSize:18),): //show message if there is no any transaction
                        Column(  //or populate list to Column children if there is transaction data.
                          children:

                          _homeController.myTransactions.map((transaction){
                            final text = transaction.amount;
                            final bool isIncome = transaction.type == 'دخل' ? true : false;
                            final formatAmount = isIncome ? ' $text +' : ' $text -';
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
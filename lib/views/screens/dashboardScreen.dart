import 'package:budget_tracker/controllers/chart_controller.dart';
import 'package:budget_tracker/models/transactionModel.dart';
import 'package:budget_tracker/views/screens/edit_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:intl/intl.dart';
import '../../controllers/add_goal_controller.dart';
import '../../controllers/home_controlle.dart';
import '../widgets/chartIndicator.dart';
import '../widgets/transaction.dart';
import 'edit_goals.dart';
import 'file.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardScreen extends StatelessWidget {
  final ChartController _chartController = Get.put(ChartController());
  final HomeController _homeController = Get.find<HomeController>();
  final GoalsController _goalController = Get.find<GoalsController>();

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
    print("other ${_chartController.totalother}");
    print("Health ${_chartController.totalHealth}");

    Map<String, double> dataMap = {
      "الصحة": _chartController.totalHealth.value,
      "النقل": _chartController.totaltrans.value,
      "سفر": _chartController.totalInternts.value,
      "مقاضي": _chartController.totalgrocery.value,
      "أخرى": _chartController.totalother.value,
    }.obs;
    Map<String, String> dataMaps = {
      "الصحة":
          "ريال  ${_chartController.totalHealth.value}                           الصحه ",
      "النقل":
          " ريال ${_chartController.totaltrans.value}                           النقل ",
      "سفر":
          " ريال ${_chartController.totalInternts.value}                          السفر ",
      "مقاضي":
          " ريال ${_chartController.totalgrocery.value}                      المقاضي ",
      "أخرى":
          " ريال ${_chartController.totalother.value}                            أخرى ",
    };

    int touchedIndex = 1;
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text(
            "وضعك المالي",
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 2,
                initialAngleInDegree: 0,
                centerText:
                    "${_homeController.totalExpense.value} SR \n مجموع المصاريف",
                centerTextStyle: TextStyle(
                  fontSize: 20,
                  color: textColor,
                ),
                ringStrokeWidth: 27,
                chartLegendSpacing: 60,
                animationDuration: const Duration(seconds: 3),
                chartType: ChartType.ring,
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  decimalPlaces: 1,
                  showChartValuesOutside: true,
                  showChartValueBackground: false,
                ),
                legendLabels: dataMaps,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  showLegends: true,
                  legendShape: BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                  legendPosition: LegendPosition.bottom,
                ),
              ),
            ),
            Container(
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "آخر العمليات",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: detailColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),

              ]),

            ),
            Expanded(
              child: _homeController.myTransactions.length == 0
                  ? Text(
                "لا توجد عمليات لعرضها",
                style: TextStyle(fontSize: 18),
              )
                  : //show message if there is no any transaction
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _homeController.myTransactions.length,
                itemBuilder: (context, i) {
                  final transaction = _homeController.myTransactions[i];
                  final text = transaction.amount;

                  final bool isIncome =
                  transaction.type == 'دخل' ? true : false;
                  final formatAmount = isIncome ? '+ $text' : '- $text';

                  return GestureDetector(
                    onTap: () async {
                      Scaffold.of(context).showBottomSheet<void>(
                          ((BuildContext context) {
                            return Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white70, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                    height: 532,
                                    child: EditTransaction(
                                      transactionModel: transaction,
                                    )));
                          }));
                      await _homeController.getTransactions();
                    },
                    child: TransactionWidget(
                        transactionModel: transaction,
                        formatAmount: formatAmount,
                        isIncome: isIncome),
                  );

                  return SizedBox();
                },
              ), //or populate list to Column children if there is transaction data.

            ),
          ]),

        )));
  }
}
//       Scaffold.of(context)
// .showBottomSheet<void>(((BuildContext context) {
// return Card(
// shape: RoundedRectangleBorder(
// side: BorderSide(color: Colors.white70, width: 1),
// borderRadius: BorderRadius.circular(10),
// ),
// child: Container(
// height: 532,
// child: EditTransaction(transactionModel: transaction,)));
// }));

import 'package:budget_tracker/controllers/chart_controller.dart';
import 'package:budget_tracker/views/screens/edit_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_tracker/constants/colors.dart';
import '../../controllers/home_controlle.dart';
import '../../routes/routes.dart';
import '../widgets/transaction.dart';
import 'package:pie_chart/pie_chart.dart';


class DashboardScreen extends StatelessWidget {
  final ChartController _chartController = Get.find<ChartController>();
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
    print("other ${_chartController.totalother}");
    print("Health ${_homeController.totalHealth}");

    Map<String, double> dataMap = {
      "الصحة": _homeController.totalHealth.value,
      "النقل": _homeController.totaltrans.value,
      "سفر": _homeController.totalInternts.value,
      "مقاضي": _homeController.totalgrocery.value,
      "أخرى": _homeController.totalother.value,
    }.obs;
    Map<String, String> dataMaps = {
      "الصحة":
          "ريال  ${_homeController.totalHealth.value}                           الصحه ",
      "النقل":
          " ريال ${_homeController.totaltrans.value}                           النقل ",
      "سفر":
          " ريال ${_homeController.totalInternts.value}                          السفر ",
      "مقاضي":
          " ريال ${_homeController.totalgrocery.value}                      المقاضي ",
      "أخرى":
          " ريال ${_homeController.totalother.value}                            أخرى ",
    };

    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text(
            "وضعك المالي",
          ),
              leading: GestureDetector(
            onTap: () {
              Get.offNamed(Routes.homeScreen);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
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
                centerTextStyle: const TextStyle(
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
                  ? //show message if there is no any transaction
                  const Text(
                      "لا توجد عمليات لعرضها",
                      style: TextStyle(fontSize: 18),
                    )
                  : ListView.builder(
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
                            Scaffold.of(context)
                                .showBottomSheet<void>(((BuildContext context) {
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
                            // Get.toNamed(Routes.editTransaction);
                          },
                          child: TransactionWidget(
                              transactionModel: transaction,
                              formatAmount: formatAmount,
                              isIncome: isIncome),
                        );
                      },
                    ),
              //or populate list to Column children if there is transaction data.
            ),
          ]),
        )));
  }
}

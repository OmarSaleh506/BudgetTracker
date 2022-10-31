import 'package:budget_tracker/views/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:budget_tracker/views/widgets/home_Screen/barchart.dart';

import '../../../constants/colors.dart';
import '../../../controllers/chart_controller.dart';

class Budget extends StatelessWidget {
  final ChartController _chartController = Get.put(ChartController());

  Budget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final chartData = [
      Data(units: _chartController.totalgrocery.value, color: expenseColor),
      Data(units: _chartController.totalInternts.value, color: primaryColor),
      Data(units: _chartController.totaltrans.value, color: darkBlueColor),
      Data(units: _chartController.totalother.value, color: lightpinkColor),
      Data(units: _chartController.totalHealth.value, color: warningColor),
      Data(units: 0, color: const Color(
          0xFFC7C3CE)),
    ];
    print(chartData[1]);

    return  Column(

      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'تقارير',
          style: TextStyle(
              color: detailColor, fontWeight: FontWeight.w700, fontSize: 18),
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
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'وين راحت؟',
                      style: TextStyle(
                        color: detailColor,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                     child: SizedBox(
                       height: 18,
                       child:   HorizontalBarChart(
                         data: chartData,
                       ),
                     ),
                   ),
                    SizedBox(height: 3),

                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'مقاضي',
                                style: TextStyle(
                                    color: detailColor, letterSpacing: 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xffFF5678),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                width: 7,
                                height: 7,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'النقل',
                                style: TextStyle(
                                    color: detailColor, letterSpacing: 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: darkBlueColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                width: 7,
                                height: 7,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              const Text(
                                'الصحة',
                                style: TextStyle(
                                    color: detailColor, letterSpacing: 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: warningColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                width: 7,
                                height: 7,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              const Text(
                                'انترنت',
                                style: TextStyle(
                                    color: detailColor, letterSpacing: 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: primaryColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                width: 7,
                                height: 7,
                              ),
                            ],
                          ),

                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: InkWell( onTap:(){
                        Get.to(DashboardScreen());
                      } , child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("المزيد", style: TextStyle(color: detailColor),),],
                      ), ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );

  }
}

import 'package:budget_tracker/controllers/home_controlle.dart';
import 'package:budget_tracker/routes/routes.dart';
import 'package:budget_tracker/views/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:budget_tracker/views/widgets/home_Screen/barchart.dart';

import '../../../constants/colors.dart';
import '../../../controllers/chart_controller.dart';

class Budget extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  Budget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartData = [
      Data(units: _homeController.totalgrocery.value, color: purpleColor),
      Data(units: _homeController.totalInternts.value, color: lightBlueColor),
      Data(units: _homeController.totaltrans.value, color: darkBlueColor),
      Data(units: _homeController.totalother.value, color: lightpinkColor),
      Data(units: _homeController.totalHealth.value, color: warningColor),
      Data(units: 0, color: const Color(0xFFC7C3CE)),
    ].obs;
    print(chartData[1].units);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'تقارير',
          style: TextStyle(
              color: detailColor, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
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
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<HomeController>(
                      builder: (_) {
                        return Center(
                        child: SizedBox(
                        height: 18,
                        child: HorizontalBarChart(
                          data: chartData,

                        ), ),
                        );

                      },

                    ),
                    const SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left: 105),
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
                                  color: purpleColor,
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
                                'نقل',
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
                                'صحة',
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
                                'سفر',
                                style: TextStyle(
                                    color: detailColor, letterSpacing: 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: lightBlueColor,
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
                      child: InkWell(
                        onTap: () {
                          Get.offNamed(Routes.dashboardScreen);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "المزيد",
                              style: TextStyle(color: detailColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

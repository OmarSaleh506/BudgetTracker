import 'package:budget_tracker/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/home_controlle.dart';
import '../widgets/home_Screen/add_goal.dart';
import '../widgets/home_Screen/budget.dart';
import '../widgets/home_Screen/current_overview.dart';
import '../widgets/home_Screen/dashbord.dart';
import '../widgets/home_Screen/goals.dart';
import '../widgets/home_Screen/header.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  HomeScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment(0, 54),
                children: <Widget>[Header(), DashBord()],
              ),
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Builder(builder: (context) {
                  if (_homeController.totalIncome.value <
                      _homeController.totalExpense.value)
                    return Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.only(
                          left: 100, top: 2, right: 100, bottom: 2),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: expenseColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        ' 😱 صرفت آكثر من ما دخلت',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: expenseColor),
                      ),
                    );
                  else if (_homeController.totalIncome.value >
                      _homeController.totalExpense.value)
                    return Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.only(
                          left: 100, top: 2, right: 100, bottom: 2),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: detailColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        '👍 كفو دخلت آكثر من ما صرفت',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: detailColor),
                      ),
                    );
                  else
                    return SizedBox(
                      height: 1,
                    );
                }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(270, 0, 0, 10),
                child: Text(
                  'معدل صرفك',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: detailColor),
                ),
              ),
              CurrentOverview(),
              const SizedBox(
                height: 20,
              ),
              Budget(),
              AddGoal()
            ],
          )),
    );
  }
}

import 'package:budget_tracker/constants/colors.dart';
import 'package:budget_tracker/views/widgets/home_Screen/goals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/goal_controller.dart';
import '../../controllers/home_controlle.dart';
import '../../models/goalModel.dart';
import '../widgets/home_Screen/add_new_goal.dart';
import '../widgets/home_Screen/add_new_transaction.dart';
import '../widgets/home_Screen/all_goals.dart';
import '../widgets/home_Screen/budget.dart';
import '../widgets/home_Screen/current_overview.dart';
import '../widgets/home_Screen/dashbord.dart';
import '../widgets/home_Screen/header.dart';
import 'edit_goals.dart';

class HomeScreen extends StatelessWidget {
  final  _homeController = Get.find<HomeController>();
  final  _goalController = Get.find<GoalsController>();
  HomeScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    bool check = false;
    GoalModel goalModel;
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
              SizedBox(
                height: 20,
              ),
              Budget(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 290),
                child: Text(
                  'أهداف',
                  style: TextStyle(
                    color: detailColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Builder(builder: (context) {
                if (_goalController.myGoal.isEmpty) {
                  return AddNewGoal();
                } else if (_goalController.myGoal.isNotEmpty) {
                  return Column(
                    children: [
                      GestureDetector(
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
                                    child: EditGoal(
                                      goalModel: _goalController.myGoal.last,
                                    )));
                          }));
                          await _goalController.getTransactions();
                        },
                        child: Goals(goalModel: _goalController.myGoal.last),
                      ),
                      AllGoals(),
                    ],
                  );
                } else
                  return SizedBox(
                    height: 0,
                  );
              }),
              AddNewTransaction(),
            ],
          )),
    );
  }
}

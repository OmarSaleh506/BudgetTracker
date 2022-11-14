import 'package:budget_tracker/constants/colors.dart';
import 'package:budget_tracker/views/widgets/home_Screen/goals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
  final _homeController = Get.find<HomeController>();
  final _goalController = Get.find<GoalsController>();
  HomeScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    GoalModel goalModel;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(alignment: Alignment(0, 24.h), children: [
                  Header(),
                  DashBord(),
                ]),
                SizedBox(
                  height: 17.h,
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Builder(builder: (context) {
                    if(_homeController.myTransactions.isNotEmpty){
                      if (_homeController.totalIncome.value <
                          _homeController.totalExpense.value) {
                        return Container(
                          margin: EdgeInsets.all(1.0.w),
                          padding: EdgeInsets.only(
                              left: 26.w, top: 0.2.h, right: 26.w, bottom: 0.4.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: expenseColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.w),
                              )),
                          child: Text(
                            ' 😱 صرفت آكثر من ما دخلت',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: expenseColor,
                              letterSpacing: 0.08.w,
                            ),
                          ),
                        );
                      } else if (_homeController.totalIncome.value >
                          _homeController.totalExpense.value) {
                        return Container(
                          margin: EdgeInsets.all(1.0.w),
                          padding: EdgeInsets.only(
                              left: 26.w, top: 0.2.h, right: 26.w, bottom: 0.4.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: detailColor,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(4.w))),
                          child: Text(
                            '👍 كفو دخلت آكثر من ما صرفت',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 9.sp,
                              color: detailColor,
                              letterSpacing: 0.08.w,
                            ),
                          ),
                        );
                      } else
                        return SizedBox(
                          height: 0.h,
                        );
                    }
                    else
                      return SizedBox(
                        height: 0.h,
                      );

                  }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(62.w, 1.h, 0.w, 1.3.h),
                  child: Text(
                    'معدل صرفك',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: detailColor,
                    ),
                  ),
                ),
                CurrentOverview(),
                SizedBox(
                  height: 3.h,
                ),
                Budget(),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 67.w),
                  child: Text(
                    'أهداف',
                    style: TextStyle(
                      color: detailColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      letterSpacing: 0.5.w,
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
                            Scaffold.of(context).showBottomSheet<void>(
                              ((BuildContext context) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white70, width: 1.w),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * .7,
                                    child: EditGoal(
                                      goalModel: _goalController.myGoal.last,
                                    ),
                                  ),
                                );
                              }),
                            );
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
      ),
    );
  }
}
//  GestureDetector(
//                         onTap: () async {
//                           Get.bottomSheet(Card(
//                             shape: RoundedRectangleBorder(
//                               side:
//                                   BorderSide(color: Colors.white70, width: 1.w),
//                               borderRadius: BorderRadius.circular(5.w),
//                             ),
//                             child: EditGoal(
//                               goalModel: _goalController.myGoal.last,
//                             ),
//                           ));
//                           await _goalController.getTransactions();
//                         },
//                         child: Goals(goalModel: _goalController.myGoal.last),
//                       ),
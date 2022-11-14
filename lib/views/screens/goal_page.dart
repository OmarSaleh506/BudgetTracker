import 'package:budget_tracker/views/widgets/home_Screen/add_new_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/goal_controller.dart';
import '../widgets/home_Screen/goals.dart';
import 'edit_goals.dart';
import 'home.dart';

class GoalPage extends StatelessWidget {
  GoalPage({Key? key}) : super(key: key);
  final GoalsController _goalController = Get.put(GoalsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: TextButton(
                        onPressed: () {
                          Get.off(HomeScreen());
                        },
                        child: SvgPicture.asset('images/left.svg')),
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  Text(
                    'أهدافك',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      letterSpacing: 0.1.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                child:_goalController.myGoal.length==0 ?
                 //show message if there is no any goal
                Center(
                  child: Text(
                  "لا توجد أهداف لعرضها",
                  style: TextStyle(fontSize: 12.sp),
              ),
                )
                    : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _goalController.myGoal.length,
                  itemBuilder: (context, index) {
                    final data = _goalController.myGoal[index];
                    return GestureDetector(
                      onTap: () async {
                        Scaffold.of(context).showBottomSheet<void>(
                          ((BuildContext context) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 1.w),
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .7,
                                child: EditGoal(
                                  goalModel: data,
                                ),
                              ),
                            );
                          }),
                        );
                        await _goalController.getTransactions();
                      },
                      child: Goals(
                        goalModel: data,
                      ),
                    );
                  },
                ),
              ),
              AddNewGoal()
            ],
          ),
        ),
      ),
    );
  }
}

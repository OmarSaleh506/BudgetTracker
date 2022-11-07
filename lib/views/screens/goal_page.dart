import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/add_goal_controller.dart';
import '../widgets/home_Screen/goals.dart';
import 'edit_goals.dart';
import 'home.dart';

class GoalPage extends StatefulWidget {
  GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  final AddGoalController _addGoalController = Get.put(AddGoalController());

  final GoalsController _goalController = Get.find<GoalsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: TextButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    child: SvgPicture.asset('images/left.svg')),
              ),
              SizedBox(
                width: 110,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'أهدافك',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _goalController.myGoal.length,
              itemBuilder: (context, index) {
                final data = _goalController.myGoal[index];
                return GestureDetector(
                    onTap: () async {
                      Scaffold.of(context)
                          .showBottomSheet<void>(((BuildContext context) {
                        return Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                                height: 532,
                                child: EditGoal(
                                  goalModel: data,
                                )));
                      }));
                      await _goalController.getTransactions();
                    },
                    child: Goals(
                      goalModel: data,
                    ));
              },
            ),
          )
        ]),
      )),
    );
  }
}

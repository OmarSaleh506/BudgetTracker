import 'package:budget_tracker/constants/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/home_Screen/add_goal.dart';
import '../widgets/home_Screen/budget.dart';
import '../widgets/home_Screen/current_overview.dart';
import '../widgets/home_Screen/dashbord.dart';
import '../widgets/home_Screen/goals.dart';
import '../widgets/home_Screen/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment(0, 54),
            children: <Widget>[Header(), DashBord()],
          ),
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 210, 0),
            child: Text(
              'Current Month`s Overview',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: detailColor),
            ),
          ),
          CurrentOverview(),
          const SizedBox(
            height: 20,
          ),
          Budget(),
          Goals(),
          AddGoal()
        ],
      ),
    );
  }
}

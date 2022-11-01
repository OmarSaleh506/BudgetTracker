import 'package:flutter/material.dart';

import '../widgets/home_Screen/goals.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Goals(),
          Goals(),
          Goals(),
          Goals(),
          Goals(),
          Goals(),
          Goals(),
          Goals(),
        ],
      ),
    );
  }
}

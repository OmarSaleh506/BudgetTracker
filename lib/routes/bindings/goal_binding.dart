import 'package:budget_tracker/controllers/goal_controller.dart';
import 'package:get/get.dart';

class GoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GoalsController());
  }
}

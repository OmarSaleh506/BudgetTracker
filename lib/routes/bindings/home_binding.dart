import 'package:budget_tracker/controllers/addTrans_goal_controller.dart';
import 'package:budget_tracker/controllers/home_controlle.dart';
import 'package:get/get.dart';

import '../../controllers/goal_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(),);
    Get.put(GoalsController());
    Get.put(AddGoalController());
  }
}
 
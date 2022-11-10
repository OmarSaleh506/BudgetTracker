import 'package:budget_tracker/controllers/addTrans_goal_controller.dart';
import 'package:get/get.dart';

class AddGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddGoalController());
  }
}

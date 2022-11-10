import 'package:budget_tracker/controllers/chart_controller.dart';
import 'package:get/get.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChartController());
  }
}

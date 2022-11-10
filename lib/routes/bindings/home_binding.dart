import 'package:budget_tracker/controllers/home_controlle.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(),);
  }
}

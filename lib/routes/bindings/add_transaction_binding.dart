import 'package:budget_tracker/controllers/addTransactionController.dart';
import 'package:get/get.dart';

class AddTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTransactionController());
  }
}

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChartController extends GetxController {
  final Rx<String> _selectedCategory = Rx<String>('');

  String get selectedCategory => _selectedCategory.value;

}
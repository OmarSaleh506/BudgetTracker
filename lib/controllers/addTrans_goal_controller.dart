import 'package:get/get.dart';

class AddGoalController extends GetxController {
  final Rx<String> _selectedCategory = Rx<String>('');
  final Rx<String> _selectedDate = ''.obs;
  final Rx<String> _selectedTime = ''.obs;

  String get selectedDate => _selectedDate.value;
  String get selectedTime => _selectedTime.value;
  String get selectedCategory => _selectedCategory.value;

  updateSelectedCategory(String category) => _selectedCategory.value = category;
  updateSelectedDate(String date) => _selectedDate.value = date;
  updateSelectedTime(String time) => _selectedTime.value = time;
}

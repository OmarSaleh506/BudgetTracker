import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddGoalController extends GetxController {
  final Rx<String> _selectedCategory = Rx<String>('');
  final Rx<String> _selectedImage = Rx<String>('');
  // final Rx<String> _selectedColor = Rx<String>('');
  final Rx<String> _selectedDate = ''.obs;
  final Rx<String> _selectedTime = ''.obs;

  String get selectedDate => _selectedDate.value;
  String get selectedTime => _selectedTime.value;
  String get selectedCategory => _selectedCategory.value;
  String get selectedImage => _selectedImage.value;
  // String get selectedColor => _selectedColor.value;

  updateSelectedCategory(String category) => _selectedCategory.value = category;
  updateSelectedImage(String image) => _selectedImage.value = image;
  // updateSelectedColor(String color) => _selectedColor.value = color;

  updateSelectedDate(String date) => _selectedDate.value = date;
  updateSelectedTime(String time) => _selectedTime.value = time;
}

import 'package:get/get.dart';

class AddGoalController extends GetxController {
  final Rx<String> _selectedCategory = Rx<String>('');
  final Rx<String> _selectedImage = Rx<String>('');
  final Rx<String> _selectedColor = Rx<String>('');

  String get selectedCategory => _selectedCategory.value;
  String get selectedImage => _selectedImage.value;
  String get selectedColor => _selectedColor.value;

  updateSelectedCategory(String category) => _selectedCategory.value = category;
  updateSelectedImage(String image) => _selectedImage.value = image;
  updateSelectedColor(String color) => _selectedColor.value = color;
}

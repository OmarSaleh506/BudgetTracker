import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  final Rx<String> _transactionType = ''.obs;
  final Rx<String> _selectedCategory = Rx<String>('');
  final Rx<String> _selectedImage = Rx<String>('');

  String get selectedCategory => _selectedCategory.value;
  String get transactionType => _transactionType.value;
  String get selectedImage => _selectedImage.value;

  changeTransactionType(String transtype) => _transactionType.value = transtype;
  updateSelectedCategory(String category) => _selectedCategory.value = category;
  updateSelectedImage(String image) => _selectedCategory.value = image;
}

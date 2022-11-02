import 'package:get/get.dart';

import '../models/transactionModel.dart';

class AddTransactionController extends GetxController {
 
  final Rx<String> _transactionType = ''.obs;
  final Rx<String> _selectedCategory = Rx<String>('');

  String get selectedCategory => _selectedCategory.value;
  String get transactionType => _transactionType.value;

  changeTransactionType(String transtype) => _transactionType.value = transtype;
  updateSelectedCategory(String category) => _selectedCategory.value = category;
}

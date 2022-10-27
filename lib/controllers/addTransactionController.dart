
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  final Rx<String> _transactionType = ''.obs;
  final Rx<String> _selectedCategory = Rx<String>('');
  final Rx<String> _selectedDate = ''.obs;
 

  String get selectedDate => _selectedDate.value;
  String get selectedCategory => _selectedCategory.value;


  String get transactionType => _transactionType.value;

  changeTransactionType(String transtype) => _transactionType.value = transtype;
  updateSelectedCategory(String category) => _selectedCategory.value = category;
  updateSelectedDate(String date) => _selectedDate.value = date;
 
}
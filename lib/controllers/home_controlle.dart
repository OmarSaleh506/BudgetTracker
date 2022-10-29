import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../models/transactionModel.dart';
import '../providers/db_provider.dart';

class HomeController extends GetxController {
  final Rx<double> totalIncome = 0.0.obs;
  final Rx<double> totalExpense = 0.0.obs;
  final Rx<double> totalBalance = 0.0.obs;
  final Rx<double> totalSaved = 0.0.obs;

  // final Rx<double> _totalForSelectedDate = 0.0.obs;
  // final Rx<DateTime> _selectedDate = DateTime.now().obs;

  final Rx<List<TransactionModel>> _myTransactions =
      Rx<List<TransactionModel>>([]);

  List<TransactionModel> get myTransactions => _myTransactions.value;
  // double get totalForSelectedDate => _totalForSelectedDate.value;
  // DateTime get selectedDate => _selectedDate.value;

  @override
  void onInit() {
    super.onInit();
    getTransactions();
  }

  getTransactions() async {
    final List<TransactionModel> transactionsFromDB = [];
    List<Map<String, dynamic>> transactions =
        await DatabaseProvider.queryTransaction();
    transactionsFromDB.assignAll(transactions.reversed
        .map((data) => TransactionModel().fromJson(data))
        .toList());
    _myTransactions.value = transactionsFromDB;
    getTotalAmount(transactionsFromDB);
    tracker(transactionsFromDB);
  }

  Future<int?> deleteTransaction(String id) async {
    return await DatabaseProvider.deleteTransaction(id);
  }

  Future<int?> updateTransaction(TransactionModel transactionModel) async {
    return await DatabaseProvider.updateTransaction(transactionModel);
  }

  // updateSelectedDate(DateTime date) {
  //   _selectedDate.value = date;
  //   getTransactions();
  // }

  getTotalAmount(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double total = 0;
    for (TransactionModel transactionModel in tm) {
      if (transactionModel.type == 'Income') {
        total += double.parse(transactionModel.amount!);
      } else {
        total -= double.parse(transactionModel.amount!);
      }
    }
    // _totalForSelectedDate.value = total;
  }

  tracker(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double expense = 0;
    double income = 0;
    double balance = 0;
    double saved = 0;

    for (TransactionModel transactionModel in tm) {
      if (transactionModel.type == 'Income') {
        income += double.parse(transactionModel.amount!);
      } else {
        expense += double.parse(transactionModel.amount!);
      }
    }
    balance = income - expense;
    totalIncome.value = income;
    totalExpense.value = expense;
    totalBalance.value = balance;
    saved = saved - balance;
    totalSaved.value = saved ;
  }
}

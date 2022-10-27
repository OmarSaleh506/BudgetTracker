import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/transactionModel.dart';
import '../providers/db_provider.dart';

class HomeController extends GetxController {
  final Rx<double> totalIncome = 0.0.obs;
  final Rx<double> totalExpense = 0.0.obs;
  final Rx<double> totalBalance = 0.0.obs;
  final Rx<List<TransactionModel>> _myTransactions =
      Rx<List<TransactionModel>>([]);
  final _box = GetStorage();

  List<TransactionModel> get myTransactions => _myTransactions.value;
  getTransactions() async {
    final List<TransactionModel> transactionsFromDB = [];
    List<Map<String, dynamic>> transactions =
        await DatabaseProvider.queryTransaction();
    transactionsFromDB.assignAll(transactions.reversed
        .map((data) => TransactionModel().fromJson(data))
        .toList());
    _myTransactions.value = transactionsFromDB;
    tracker(transactionsFromDB);
  }

  Future<int?> deleteTransaction(String id) async {
    return await DatabaseProvider.deleteTransaction(id);
  }

  Future<int?> updateTransaction(TransactionModel transactionModel) async {
    return await DatabaseProvider.updateTransaction(transactionModel);
  }

  tracker(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double expense = 0;
    double income = 0;
    double balance = 0;

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
  }
}

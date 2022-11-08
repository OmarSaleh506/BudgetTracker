import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../models/transactionModel.dart';
import '../providers/db_provider.dart';
import 'add_goal_controller.dart';

final GoalsController _goalController = Get.put(GoalsController());

class HomeController extends GetxController {
  final Rx<double> totalIncome = 0.0.obs;
  final Rx<double> totalExpense = 0.0.obs;
  final Rx<double> totalBalance = 0.0.obs;
  final Rx<double> totalSaved = 0.0.obs;
  final Rx<double> totalInternts = 0.0.obs;
  final Rx<double> totalHealth = 0.0.obs;
  final Rx<double> totaltrans = 0.0.obs;
  final Rx<double> totalgrocery = 0.0.obs;
  final Rx<double> totalother = 0.0.obs;
  final Rx<double> num = 0.0.obs;

  final _box = GetStorage();

  final Rx<List<TransactionModel>> _myTransactions =
      Rx<List<TransactionModel>>([]);

  List<TransactionModel> get myTransactions => _myTransactions.value;

  @override
  void onInit() {
    getTransactions();
    super.onInit();
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
    getTotalCategoryInternet(transactionsFromDB);

  }

  Future<int?> deleteTransaction(String id) async {
    return await DatabaseProvider.deleteTransaction(id);
  }

  Future<int?> updateTransaction(TransactionModel transactionModel) async {
    return await DatabaseProvider.updateTransaction(transactionModel);
  }

  getTotalAmount(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double total = 0;
    for (TransactionModel transactionModel in tm) {
      if (transactionModel.type == 'دخل') {
        total += double.parse(transactionModel.amount!);
      } else {
        total -= double.parse(transactionModel.amount!);
      }
    }


print("in total amount");

  }

  tracker(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double expense = 0;
    double income = 0;
    double balance = 0;
    double saved = _goalController.totalSaved.value;

    for (TransactionModel transactionModel in tm) {
      if (transactionModel.type == 'دخل') {
        income += double.parse(transactionModel.amount!);
      } else {
        expense += double.parse(transactionModel.amount!);
      }
    }

    balance = income - expense;
    totalIncome.value = income;
    totalExpense.value = expense;
    totalBalance.value = balance ;
  }

  getTotalCategoryInternet(List<TransactionModel> tm) async {
    if (tm.isEmpty) {
      return;
    }
    double totalInternt = 0;
    double totalhealth = 0;
    double totaltranspo = 0;
    double totalgroceries = 0;
    double totalothers = 0;
    for (TransactionModel transactionModel in tm) {
      if (transactionModel.type == "صرف") {
        if (transactionModel.category == 'سفر') {
          totalInternt += double.parse(transactionModel.amount!);

        } else if (transactionModel.category == 'صحه') {
          totalhealth += double.parse(transactionModel.amount!);
        } else if (transactionModel.category == 'نقل') {
          totaltranspo += double.parse(transactionModel.amount!);
        } else if (transactionModel.category == 'مقاضي') {
          totalgroceries += double.parse(transactionModel.amount!);
        } else if (transactionModel.category == 'اخرى') {
          totalothers += double.parse(transactionModel.amount!);
        }
      }
    }
    totalInternts.value=totalInternt;
    totalHealth.value = totalhealth;
    totaltrans.value = totaltranspo;
    totalgrocery.value = totalgroceries;
    totalother.value = totalothers;

  }
}

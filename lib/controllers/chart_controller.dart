import 'dart:ui';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../models/transactionModel.dart';
import '../providers/db_provider.dart';

class ChartController extends GetxController {
  final Rx<String> _selectedCategory = Rx<String>('');

  final Rx<double> totalInternts = 0.0.obs;
  final Rx<double> totalHealth = 0.0.obs;
  final Rx<double> totaltrans = 0.0.obs;
  final Rx<double> totalgrocery = 0.0.obs;
  final Rx<double> totalother = 0.0.obs;
  final Rx<double> num = 0.0.obs;

  final _box = GetStorage();

  final Rx<double> totalexpense = 0.0.obs;

  final Rx<List<TransactionModel>> _myTransactions =
      Rx<List<TransactionModel>>([]);
  List<TransactionModel> get myTransactions => _myTransactions.value;
  String get selectedCategory => _selectedCategory.value;

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  getTotalAmount(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double total = 0;
    for (TransactionModel transactionModel in tm) {
      if (transactionModel.category == 'دخل') {
        total += double.parse(transactionModel.amount!);
      } else {
        total -= double.parse(transactionModel.amount!);
      }
    }


  }

  getTransactions() async {
    final List<TransactionModel> transactionsFromDB = [];
    List<Map<String, dynamic>> transactions =
        await DatabaseProvider.queryTransaction();
    transactionsFromDB.assignAll(transactions.reversed
        .map((data) => TransactionModel().fromJson(data))
        .toList());
    _myTransactions.value = transactionsFromDB;
    getTotalCategoryInternet(transactionsFromDB);
    getTotalAmount(transactionsFromDB);
    tracker(transactionsFromDB);
  }

  tracker(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double expense = 0;
    double income = 0;
    double balance = 0;

    for (TransactionModel transactionModel in tm) {
      if (transactionModel.type == 'دخل') {
        income += double.parse(transactionModel.amount!);
      } else {
        expense += double.parse(transactionModel.amount!);
      }
    }
    totalexpense.value = expense;
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

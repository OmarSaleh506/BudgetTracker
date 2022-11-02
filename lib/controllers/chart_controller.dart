import 'dart:ui';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:budget_tracker/views/widgets/home_Screen/barchart.dart';
import 'package:get_storage/get_storage.dart';

import '../models/transactionModel.dart';
import '../providers/db_provider.dart';

class ChartController extends GetxController {
  final Rx<String> _selectedCategory = Rx<String>('');

  final Rx<double> totalInternts=0.0.obs;
  final Rx<double> totalHealth=0.0.obs;
  final Rx<double> totaltrans=0.0.obs;
  final Rx<double> totalgrocery=0.0.obs;
  final Rx<double> totalother=0.0.obs;
  final Rx<double> num=0.0.obs;

  // var lista= <Data>[].obs;

  final _box = GetStorage();



  final Rx<double> totalexpense=0.0.obs;



  final Rx<List<TransactionModel>> _myTransactions =
  Rx<List<TransactionModel>>([]);
  List<TransactionModel> get myTransactions => _myTransactions.value;
  String get selectedCategory => _selectedCategory.value;


  @override
  void onInit(){

    getTransactions();
    super.onInit();
  }

  getTotalAmount(List<TransactionModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double total = 0;
    for (TransactionModel transactionModel in tm) {
      if (transactionModel.category == 'Income') {
        total += double.parse(transactionModel.amount!);
      } else {
        total -= double.parse(transactionModel.amount!);
      }
    }

    // _totalForSelectedDate.value = total;
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
      if (transactionModel.type == 'Income') {
        income += double.parse(transactionModel.amount!);
      } else {
        expense += double.parse(transactionModel.amount!);
      }
    }
    totalexpense.value = expense;
  }

  getTotalCategoryInternet(List<TransactionModel> tm) async{
    if (tm.isEmpty) {
      return;
    }
    double totalInternt = 0;
    double totalhealth = 0;
    double totaltranspo = 0;
    double totalgroceries=0;
    double totalothers=0;
    for (TransactionModel transactionModel in tm) {
      if(transactionModel.type=="Spending"){

        if (transactionModel.category == 'Internet') {

          totalInternt += double.parse(transactionModel.amount!);
          await _box.write("Internet",totalInternts.value=totalInternt );
        }else if (transactionModel.category == 'Health'){
          totalhealth += double.parse(transactionModel.amount!);
          totalHealth.value=totalhealth;
        }else if (transactionModel.category == 'Transportation'){
          totaltranspo += double.parse(transactionModel.amount!);
          totaltrans.value=totaltranspo;
        } else if(transactionModel.category== 'Grocery'){
          totalgroceries += double.parse(transactionModel.amount!);
          totalgrocery.value=totalgroceries;
        }else if(transactionModel.category== 'other'){
          totalothers += double.parse(transactionModel.amount!);
          totalother.value=totalothers;
        }

      }


    }

    getTransactions();
    // _totalForSelectedDate.value = total;
  }
  // getTotalCategoryHealth(List<TransactionModel> tm) {
  //   if (tm.isEmpty) {
  //     return;
  //   }
  //   double totalhealth = 0;
  //   for (TransactionModel transactionModel in tm) {
  //     if (transactionModel.category == 'Health') {
  //       totalhealth += double.parse(transactionModel.amount!);
  //     }
  //     totalHealth.value=totalhealth;
  //
  //   }
  //   getTransactions();
  //   // _totalForSelectedDate.value = total;
  // }
  // getTotalCategoryInternet(List<TransactionModel> tm) {
  //   if (tm.isEmpty) {
  //     return;
  //   }
  //   double totalInternt = 0;
  //   for (TransactionModel transactionModel in tm) {
  //     if (transactionModel.category == 'Internet') {
  //       totalInternt += double.parse(transactionModel.amount!);
  //     }
  //     totalInternts.value=totalInternt;
  //
  //   }
  //   getTransactions();
  //   // _totalForSelectedDate.value = total;
  // }
  // getTotalCategoryInternet(List<TransactionModel> tm) {
  //   if (tm.isEmpty) {
  //     return;
  //   }
  //   double totalInternt = 0;
  //   for (TransactionModel transactionModel in tm) {
  //     if (transactionModel.category == 'Internet') {
  //       totalInternt += double.parse(transactionModel.amount!);
  //     }
  //     totalInternts.value=totalInternt;
  //
  //   }
  //   getTransactions();
  //   // _totalForSelectedDate.value = total;
  // }
  // getTotalCategoryInternet(List<TransactionModel> tm) {
  //   if (tm.isEmpty) {
  //     return;
  //   }
  //   double totalInternt = 0;
  //   for (TransactionModel transactionModel in tm) {
  //     if (transactionModel.category == 'Internet') {
  //       totalInternt += double.parse(transactionModel.amount!);
  //     }
  //     totalInternts.value=totalInternt;
  //
  //   }
  //   getTransactions();
  //   // _totalForSelectedDate.value = total;
  // }

}
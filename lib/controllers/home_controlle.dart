import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../models/transactionModel.dart';
import '../providers/db_provider.dart';
import 'add_goal_controller.dart';
//saved += double.parse(saved.toString());

final GoalsController _goalController = Get.put(GoalsController());

class HomeController extends GetxController {
  final Rx<double> totalIncome = 0.0.obs;
  final Rx<double> totalExpense = 0.0.obs;
  final Rx<double> totalBalance = 0.0.obs;
  final Rx<double> totalSaved = 0.0.obs;
  final Rx<double> totalInternts=0.0.obs;
  final Rx<double> totalHealth=0.0.obs;
  final Rx<double> totaltrans=0.0.obs;
  final Rx<double> totalgrocery=0.0.obs;
  final Rx<double> totalother=0.0.obs;
  final Rx<double> num=0.0.obs;


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
      if (transactionModel.type == 'Income') {
        total += double.parse(transactionModel.amount!);
      } else {
        total -= double.parse(transactionModel.amount!);
      }
    }

   totalBalance.value =total;
   print("this is total in getTotalAmonut ${total}");
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
      if (transactionModel.type == 'Income') {
        income += double.parse(transactionModel.amount!);
      } else {
        expense += double.parse(transactionModel.amount!);
      }
    }

    balance = income - expense;
    totalIncome.value = income;
    totalExpense.value = expense;
    totalBalance.value = balance - saved;
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

    // _totalForSelectedDate.value = total;
  }
}

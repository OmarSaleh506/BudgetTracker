import 'package:get/get.dart';
import '../models/goalModel.dart';
import '../providers/db_provider_goals.dart';

class GoalsController extends GetxController {
  final Rx<double> totalGoalAmount = 0.0.obs;
  final Rx<double> totalSaved = 0.0.obs;

  final Rx<List<GoalModel>> _myTransactions = Rx<List<GoalModel>>([]);

  List<GoalModel> get myTransactions => _myTransactions.value;

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  getTransactions() async {
    final List<GoalModel> transactionsFromDB = [];
    List<Map<String, dynamic>> transactions =
        await DatabaseProviderGoals.queryGoal();
    transactionsFromDB.assignAll(transactions.reversed
        .map((data) => GoalModel().fromJson(data))
        .toList());
    _myTransactions.value = transactionsFromDB;
    getTotalAmount(transactionsFromDB);
    tracker(transactionsFromDB);
  }

  Future<int?> deleteTransaction(String id) async {
    return await DatabaseProviderGoals.deleteGoal(id);
  }

  Future<int?> updateTransaction(GoalModel transactionModel) async {
    return await DatabaseProviderGoals.updateGoal(transactionModel);
  }

  getTotalAmount(List<GoalModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double total = 0;
    for (GoalModel transactionGoalModel in tm) {
      if (transactionGoalModel.category == 'category') {
        total += double.parse(transactionGoalModel.savedAmount!);
      } else {
        total -= double.parse(transactionGoalModel.savedAmount!);
      }
    }

    getTransactions();
  }

  tracker(List<GoalModel> tm) {
    if (tm.isEmpty) {
      return;
    }
    double goalAmount = 0;
    double saved = 0;
    double balance = 0;

    for (GoalModel transactionGoalModel in tm) {
      if (transactionGoalModel.category == 'category') {
        saved += double.parse(transactionGoalModel.goalAmount!);
      } else {
        saved += double.parse(transactionGoalModel.goalAmount!);
      }
    }
    saved = saved - balance;
    goalAmount = goalAmount - saved;
    totalGoalAmount.value = goalAmount;
    totalSaved.value = saved;
  }
}

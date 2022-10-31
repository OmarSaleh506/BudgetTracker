import 'package:get/get.dart';
import '../models/goalModel.dart';
import '../providers/db_provider_goals.dart';
import 'home_controlle.dart';

class GoalsController extends GetxController {
  final Rx<double> totalGoalAmount = 0.0.obs;
  final Rx<double> totalGoalAmountLeft = 0.0.obs;
  final Rx<double> totalSaved = 0.0.obs;

  final HomeController _homeController = Get.put(HomeController());

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

  Future<int> deleteTransaction(String id) async {
    return await DatabaseProviderGoals.deleteGoal(id);
  }

  Future<int> updateTransaction(GoalModel transactionModel) async {
    return await DatabaseProviderGoals.updateGoal(transactionModel);
  }

  getTotalAmount(List<GoalModel> gm) {
    if (gm.isEmpty) {
      return;
    }
    double total = 0;
    for (GoalModel transactionGoalModel in gm) {
      total += double.parse(transactionGoalModel.savedAmount!);
      total += double.parse(transactionGoalModel.goalAmount!);
      total += double.parse(transactionGoalModel.goalAmountLeft!);
    }

    getTransactions();
  }

  tracker(List<GoalModel> gm) {
    if (gm.isEmpty) {
      return;
    }
    double goalAmount = 0; //gg
    double goalAmountLeft = 0;
    double saved = 0;

    for (GoalModel transactionGoalModel in gm) {
      saved += double.parse(transactionGoalModel.savedAmount!);
      goalAmount += double.parse(transactionGoalModel.goalAmount!);
      goalAmountLeft += double.parse(transactionGoalModel.goalAmountLeft!);
    }
    // saved = saved - b;
    // goalAmount = goalAmount - saved;
    // totalGoalAmount.value = goalAmount;
    // totalSaved.value = saved;
    // totalBalance.value = b;

    totalSaved.value = saved; //on dash board and on goal
    goalAmountLeft = goalAmount - saved; //on total goal amount left
    totalGoalAmountLeft.value = goalAmountLeft;
    totalGoalAmount.value = goalAmount;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/add_goal_controller.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider_goals.dart';
import '../widgets/custom_edit_goal.dart';
import '../widgets/home_Screen/custom_text.dart';

class EditGoal extends StatefulWidget {
  EditGoal({Key? key, required this.goalModel}) : super(key: key);
  final GoalModel goalModel;
  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  final GoalsController goalController = Get.put(GoalsController());

  final AddGoalController addGoalTransactionController =
      Get.put(AddGoalController());
  final TextEditingController _goalAmountController = TextEditingController();
  final TextEditingController _savedAmountController = TextEditingController();
  final TextEditingController _goalAmountLeftController =
      TextEditingController();
  final GoalsController _goalController = Get.find<GoalsController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      _goalAmountController.text = widget.goalModel.goalAmount!;
      _savedAmountController.text = widget.goalModel.savedAmount!;
      double amountLeft = double.parse(_goalAmountController.text) -
          double.parse(_savedAmountController.text);
      _goalAmountLeftController.text = amountLeft.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.expand_less,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff1C6DD0),
              child: SvgPicture.asset(
                "${widget.goalModel.image}",
                color: lightModeScaffoldBgCle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${widget.goalModel.category}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFialedEditGoal(
                text: "المبلغ",
                hint: widget.goalModel.goalAmount,
                controller: _goalAmountController),
            SizedBox(
              height: 20,
            ),
            CustomTextFialedEditGoal(
                text: "ادخرت",
                hint: widget.goalModel.savedAmount,
                controller: _savedAmountController),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 58,
              width: 351,
              child: ElevatedButton(
                onPressed: () async {
                  print(_goalAmountController.text);
                  print(_savedAmountController.text);
                  print(_goalAmountLeftController.text);
                  await _updateGoal();
                  await _goalController.getTransactions();

                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xffEEEEEE)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextGoal(
                      text: 'تعديل الهدف',
                      fontSize: 18,
                      color: darkBlueColor,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset('images/pencil.svg')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 58,
              width: 351,
              child: TextButton(
                onPressed: () async {
                  await DatabaseProviderGoals.deleteGoal(widget.goalModel.id!);
                  await goalController.getTransactions();
                  Get.back();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xffFFFFFF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextGoal(
                      text: 'حذف الهدف',
                      fontSize: 18,
                      color: expenseColor,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset('images/trash.svg'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _updateGoal() async {
    if (_goalAmountController.text.isEmpty ||
        _savedAmountController.text.isEmpty) {
      Get.snackbar(
        'Required',
        'All fields are requried',
      );
    } else {
      final GoalModel transactionModel = GoalModel(
        goalAmount: _goalAmountController.text,
        savedAmount: _savedAmountController.text,
        goalAmountLeft: _goalAmountLeftController.text,
        category: widget.goalModel.category,
        color: widget.goalModel.color,
        image: widget.goalModel.image,
        id: widget.goalModel.id,
      );
      await DatabaseProviderGoals.updateGoal(transactionModel);
      Get.back();
    }
  }
}

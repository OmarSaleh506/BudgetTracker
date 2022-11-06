import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider_goals.dart';
import '../widgets/custom_edit_goal.dart';
import '../widgets/home_Screen/custom_text.dart';
import 'goal_page.dart';

class EditGoal extends StatefulWidget {
  final GoalModel goalModel;

  EditGoal({Key? key, required this.goalModel}) : super(key: key);

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  final TextEditingController goalAmountController = TextEditingController();

  final TextEditingController savedAmountController = TextEditingController();

  final AddGoalController addGoalTransactionController =
      Get.put(AddGoalController());
  @override
  void initState() {
    super.initState();
    setState(() {
      goalAmountController.text = widget.goalModel.goalAmount!;
      savedAmountController.text = widget.goalModel.savedAmount!;
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateGoal() async {
      if (goalAmountController.text.isEmpty ||
          savedAmountController.text.isEmpty) {
        Get.snackbar(
          'Required',
          'All fields are requried',
        );
      } else {
        final GoalModel transactionModel = GoalModel(
          id: DateTime.now().toString(),
          goalAmount: goalAmountController.text,
          savedAmount: savedAmountController.text,
          goalAmountLeft: '0.0',
        );
        await DatabaseProviderGoals.updateGoal(transactionModel);
        Get.to(GoalPage());
        print("this is goalAmount ${transactionModel.goalAmount}");
        print("this is savedAmount ${transactionModel.savedAmount}");
      }
    }

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
                "lib/constants/goalsIcons/house.svg",
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
                controller: goalAmountController),
            SizedBox(
              height: 20,
            ),
            CustomTextFialedEditGoal(
                text: "ادخرت",
                hint: widget.goalModel.savedAmount,
                controller: savedAmountController),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 58,
              width: 351,
              child: ElevatedButton(
                onPressed: () async {
                  _updateGoal();
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
}

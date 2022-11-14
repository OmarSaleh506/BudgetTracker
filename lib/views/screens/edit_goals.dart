import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/input_formatter.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/goal_controller.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider_goals.dart';
import '../widgets/custom_edit_goal.dart';
import '../widgets/home_Screen/custom_text.dart';

class EditGoal extends StatefulWidget {
  EditGoal({Key? key, this.goalModel}) : super(key: key);
  final GoalModel? goalModel;
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
      _goalAmountController.text = widget.goalModel!.goalAmount!;
      _savedAmountController.text = widget.goalModel!.savedAmount!;
      double amountLeft = double.parse(_goalAmountController.text) -
          double.parse(_savedAmountController.text);
      _goalAmountLeftController.text = amountLeft.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    String? color = widget.goalModel!.color;
    int colors = int.parse(color!);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.expand_less,
            color: Colors.black,
          ),
          SizedBox(
            height: 2.h,
          ),
          CircleAvatar(
            radius: 5.w,
            backgroundColor: Color(colors),
            child: SvgPicture.asset(
              "${widget.goalModel!.image}",
              color: lightModeScaffoldBgCle,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            '${widget.goalModel!.category}',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              letterSpacing: 0.2.w,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomTextFialedEditGoal(
            text: "المبلغ",
            hint: widget.goalModel?.goalAmount,
            controller: _goalAmountController,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFialedEditGoal(
            text: "ادخرت",
            hint: widget.goalModel?.savedAmount,
            controller: _savedAmountController,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 6.5.h,
            width: 87.w,
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
                    width: 4.w,
                  ),
                  SvgPicture.asset('images/pencil.svg')
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 6.5.h,
            width: 87.w,
            child: TextButton(
              onPressed: () async {
                await goalController.deleteGoal(widget.goalModel!.id!);
                await goalController.getTransactions();
                Get.back();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xffFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w),
                  ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextGoal(
                    text: 'حذف الهدف',
                    fontSize: 13.sp,
                    color: expenseColor,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset('images/trash.svg'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.h,
          ),
        ],
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
        category: widget.goalModel!.category,
        color: widget.goalModel!.color,
        image: widget.goalModel!.image,
        id: widget.goalModel!.id,
      );
      await goalController.updateGoal(transactionModel);
      Get.back();
    }
  }
}

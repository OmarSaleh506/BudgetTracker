import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants/goal_categories.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider_goals.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';

import '../widgets/add_goals/input_field.dart';
import '../widgets/home_Screen/custom_TextField.dart';
import '../widgets/home_Screen/custom_text.dart';

class AddGoals extends StatefulWidget {
  AddGoals({super.key});

  @override
  State<AddGoals> createState() => _AddGoalsState();
}

class _AddGoalsState extends State<AddGoals> {
  List<bool> isCardEnabled = [];
  @override
  Widget build(BuildContext context) {
    final AddGoalController _addTransactionController =
        Get.put(AddGoalController());
    final TextEditingController _goalAmountController = TextEditingController();
    final TextEditingController _savedAmountController =
        TextEditingController();

    final DateTime now = DateTime.now();

    _addGoalsTransaction() async {
      if (_goalAmountController.text.isEmpty ||
          _savedAmountController.text.isEmpty) {
        Get.snackbar(
          'Required',
          'All fields are requried',
        );
      } else {
        final GoalModel transactionModel = GoalModel(
          id: DateTime.now().toString(),
          goalAmount: _goalAmountController.text,
          goalAmountLeft: '0.0',
          savedAmount: _savedAmountController.text,
          date: _addTransactionController.selectedDate.isNotEmpty
              ? _addTransactionController.selectedDate
              : DateFormat.yMd().format(now),
          time: _addTransactionController.selectedTime.isNotEmpty
              ? _addTransactionController.selectedTime
              : DateFormat('hh:mm a').format(now),
          category: _addTransactionController.selectedCategory,
          image: _addTransactionController.selectedImage,
        );
        await DatabaseProviderGoals.insertGoal(transactionModel);
        Get.to(HomeScreen());
      }
    }

    _getTimeFromUser(
      BuildContext context,
    ) async {
      String? formatedTime;
      await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: DateTime.now().hour,
          minute: DateTime.now().minute,
        ),
      ).then((value) => formatedTime = value!.format(context));

      _addTransactionController.updateSelectedTime(formatedTime!);
    }

    _getDateFromUser(BuildContext context) async {
      DateTime? pickerDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2012),
          initialDate: DateTime.now(),
          lastDate: DateTime(2122));

      if (pickerDate != null) {
        _addTransactionController
            .updateSelectedDate(DateFormat.yMd().format(pickerDate));
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            children: [
              Icon(
                Icons.expand_less,
                color: Colors.black,
              ),
              CustomTextGoal(text: 'هدفك'),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemCount: categoriesGoals.length,
                    itemBuilder: (BuildContext context, int index) {
                      isCardEnabled.add(false);
                      final data = categoriesGoals[index];
                      return GestureDetector(
                        onTap: () {
                          _addTransactionController
                              .updateSelectedCategory(data.name ?? '');
                          _addTransactionController
                              .updateSelectedImage(data.image ?? '');
                          isCardEnabled.replaceRange(0, isCardEnabled.length, [
                            for (int i = 0; i < isCardEnabled.length; i++) false
                          ]);
                          isCardEnabled[index] = true;
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Card(
                                color: isCardEnabled[index]
                                    ? Color(0xffFF5678)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: SvgPicture.asset(data.image ?? ''),
                                ),
                              ),
                            ),
                            CustomTextGoal(
                              text: data.name ?? '',
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              CustomTextFieldGoal(
                controller: _goalAmountController,
                text: 'المبلغ',
                hint: '200,000...',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFieldGoal(
                controller: _savedAmountController,
                text: 'أدخرت',
                hint: '200,000...',
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 311,
                child: ElevatedButton(
                  onPressed: () async {
                    await DatabaseProviderGoals();
                    _addGoalsTransaction();
                    Get.back();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  child: CustomTextGoal(
                    text: 'أضف',
                    fontSize: 18,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

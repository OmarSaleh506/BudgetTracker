import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants/goal_categories.dart';
import '../../controllers/addTransactionController.dart';
import '../../models/transactionModel.dart';
import '../../providers/db_provider.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

import '../widgets/add_goals/input_field.dart';

class AddGoals extends StatefulWidget {
  AddGoals({super.key});

  @override
  State<AddGoals> createState() => _AddGoalsState();
}

class _AddGoalsState extends State<AddGoals> {
  List<bool> isCardEnabled = [];
  @override
  Widget build(BuildContext context) {
    final AddTransactionController _addTransactionController =
        Get.put(AddTransactionController());
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    final DateTime now = DateTime.now();

    _addTransaction() async {
      if (_nameController.text.isEmpty || _amountController.text.isEmpty) {
        Get.snackbar(
          'Required',
          'All fields are requried',
        );
      } else {
        final TransactionModel transactionModel = TransactionModel(
            id: DateTime.now().toString(),
            type: _addTransactionController.transactionType,
            name: _nameController.text,
            amount: _amountController.text,
            date: _addTransactionController.selectedDate.isNotEmpty
                ? _addTransactionController.selectedDate
                : DateFormat.yMd().format(now),
            category: _addTransactionController.selectedCategory);
        await DatabaseProvider.insertTransaction(transactionModel);
        Get.to(HomeScreen());
      }
    }

    final OnSelected selected = ((index, instance) {
      _addTransactionController.changeTransactionType((instance.labels[index]));
    });

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
          child: Column(children: [
            Icon(
              Icons.expand_less,
              color: Colors.black,
            ),
            CustomText(text: 'Category'),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              child: Center(child: data.icon),
                            ),
                          ),
                          CustomText(
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
            CustomTextField(
              controller: _amountController,
              text: 'Amount',
              hint: '200,000...',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _nameController,
              text: 'Saved',
              hint: '50...',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    hint: _addTransactionController.selectedDate.isNotEmpty
                        ? _addTransactionController.selectedDate
                        : DateFormat.yMd().format(now),
                    label: 'Date',
                    widget: IconButton(
                      onPressed: () => _getDateFromUser(context),
                      icon: Icon(
                        Icons.expand_more,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: InputField(
                    hint: _addTransactionController.selectedTime.isNotEmpty
                        ? _addTransactionController.selectedTime
                        : DateFormat('hh:mm a').format(now),
                    label: 'Time',
                    widget: IconButton(
                      onPressed: () => _getTimeFromUser(context),
                      icon: Icon(
                        Icons.expand_more,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 311,
              child: ElevatedButton(
                onPressed: () => Get.to(HomeScreen()),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                child: CustomText(
                  text: 'Add Goal',
                  fontSize: 18,
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ]),
        ),
      ),
    );
  }
}

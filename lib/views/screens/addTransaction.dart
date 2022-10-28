import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants/categories.dart';
import '../../controllers/addTransactionController.dart';
import '../../models/transactionModel.dart';
import '../../providers/db_provider.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

import '../widgets/input_field.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    final AddTransactionController _addTransactionController =
        Get.put(AddTransactionController());
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
    final List<String> _transactionTypes = ['Income', 'Spending'];
    bool ispressed = false;

    final DateTime now = DateTime.now();

    List<bool> isCardEnabled = [];

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
        print("this is amount ${transactionModel.amount}");
        print("this is name ${transactionModel.name}");
        print("this is type ${transactionModel.type}");
        print("this is category ${transactionModel.category}");
        print("this is date ${transactionModel.date}");
        print("this is time ${transactionModel.time}");

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
    final OnSelected selected = ((index, instance) {
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('Select $index, toggle ${instance.labels[index]}')));
      _addTransactionController.changeTransactionType((instance.labels[index]));
    });

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 95,
            ),
            FkToggle(
                width: 120,
                height: 36,
                cornerRadius: 29,
                selectedColor: Colors.white,
                backgroundColor: Colors.grey.shade300,
                enabledElementColor: Colors.black,
                disabledElementColor: Colors.grey,
                labels: _transactionTypes,
                icons: [
                  Icon(
                    Icons.call_made,
                    color: Color(0xff21AA93),
                  ),
                  Icon(
                    Icons.call_received,
                    color: Color(0xffFA6161),
                  ),
                ],
                onSelected: selected),
            SizedBox(
              height: 30,
            ),
            CustomText(text: 'Category'),
            SizedBox(
              height: 8,
            ),
            Flexible(
              child: ListView.builder(
                itemExtent: 85.0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final data = categories[index];
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          ispressed = !ispressed;
                        });
                        _addTransactionController
                            .updateSelectedCategory(data.name ?? '');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: ispressed ? expenseColor : Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 6,
                                  ),
                                ]),
                            child: data.icon,
                          ),
                          CustomText(
                            text: data.name ?? '',
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            alignment: Alignment.center,
                          )
                        ],
                      ));
                },
              ),
            ),
            CustomTextField(
              controller: _amountController,
              text: 'Amount',
              hint: '2000',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _nameController,
              text: 'Transaction Name',
              hint: 'Rent',
            ),
            SizedBox(
              height: 30,
            ),
            CustomText(text: 'Date'),
            SizedBox(
              height: 20,
            ),
            // DatePicker(
            //   DateTime.now(),
            //   initialSelectedDate: DateTime.now(),
            //   selectionColor: Color(0xffFF5678),
            //   selectedTextColor: Colors.white,
            //   onDateChange: ((selectedDate) {
            //     _addTransactionController
            //         .updateSelectedDate(DateFormat.yMd().format(selectedDate));
            //   }),
            // ),


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
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
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
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: 311,
              child: ElevatedButton(
                onPressed: () => _addTransaction(),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                child: CustomText(
                  text: 'Add Transaction',
                  fontSize: 18,
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ]),
        ),
      ),
    );
  }
}

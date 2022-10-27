import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants/categories.dart';
import '../../controllers/addTransactionController.dart';
import '../../models/transactionModel.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {

    final AddTransactionController _addTransactionController =
        Get.put(AddTransactionController());
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
    final List<String> _transactionTypes = ['Income', 'Spending'];

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
        category: _addTransactionController.selectedCategory
      );
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
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            FkToggle(
                width: 120,
                height: 36,
                cornerRadius: 29,
                selectedColor: Colors.white,
                backgroundColor: Colors.grey.shade300,
                enabledElementColor: Colors.black,
                disabledElementColor: Colors.grey,
                labels:_transactionTypes,
                icons: const [
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
              height: 10,
            ),

            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder:(context, index) {
                  final data = categories[index];
                  return   Container(
                      child: Column(
                    children: [
              
                          Card(
                             child: InkWell(onTap: () {
                              _addTransactionController.updateSelectedCategory(data);
                             }, 
                              child: SizedBox(
                                  height: 48,
                                  width: 48,
                                  child: Icon(
                                    Icons.wifi,
                                    color: Colors.black,
                                  )))),
                      CustomText(text: data,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,)
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
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Color(0xffFF5678),
              selectedTextColor: Colors.white,
              onDateChange: ((selectedDate) {
                _addTransactionController
          .updateSelectedDate(DateFormat.yMd().format(selectedDate));
              }),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: 311,
              child: ElevatedButton(
                onPressed: () => _addTransaction,
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




import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/categories.dart';
import '../../../controllers/addTransactionController.dart';
import '../../../models/transactionModel.dart';
import '../../../providers/db_provider.dart';
import '../../widgets/customText.dart';
import '../../../constants/colors.dart';
import '../../widgets/add_goals/input_field.dart';
import '../../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

import '../../widgets/number_pad.dart';



class AddTransactionAmount extends StatefulWidget {
  

  @override
  State<AddTransactionAmount> createState() => _AddTransactionAmountState();
}

class _AddTransactionAmountState extends State<AddTransactionAmount> {
  bool isCatgory = false;

  final AddTransactionController _addTransactionController =
      Get.put(AddTransactionController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final List<String> _transactionTypes = ['Income', 'Spending'];
  final OnSelected selected = ((index, instance) {
  });
  final TextEditingController _myController = TextEditingController();
  
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
            type: _addTransactionController.transactionType.isNotEmpty
                ? _addTransactionController.transactionType
                : _transactionTypes[0],
            name: _nameController.text,
            amount: _amountController.text,
            category: _addTransactionController.selectedCategory);
        await DatabaseProvider.insertTransaction(transactionModel);
        Get.to(() => HomeScreen());
        print("this is amount ${transactionModel.amount}");
        print("this is name ${transactionModel.name}");
        print("this is type ${transactionModel.type}");
        print("this is category ${transactionModel.category}");
        print("this is date ${transactionModel.date}");
        print("this is time ${transactionModel.time}");
      }
    }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       // Here, we conditionally change title
      title: isCatgory? Center(child: Text('تصنيف')) : Center(child: Text('إضافة عملية')) ,
      // Here, we conditionally change content
      content: isCatgory
          ?  Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () {}, child: Text('Button')),
                
              ],
            ) :
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
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
              TextFormField(
                style: TextStyle(fontSize: 24),
                controller: _myController,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "00.00"),
              ),
                 NumPad(
            buttonSize: 60,
            buttonColor: Colors.white,
            iconColor: Colors.red,
            controller: _myController,
            delete: () {
              _myController.text = _myController.text
                  .substring(0, _myController.text.length - 1);
            },
            // do something with the input numbers
            onSubmit: () {
              debugPrint('Your code: ${_myController.text}');
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text(
                          "You code is ${_myController.text}",
                          style: const TextStyle(fontSize: 30),
                        ),
                      ));
            },
          ),
            ],
         
          ),
         
      actions: [
        isCatgory? 
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
                  text: 'أضف',
                  fontSize: 18,
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
              ),
            ): 
        Container(
              height: 60,
              width: 311,
              child: ElevatedButton(
                 onPressed: () => setState(() => isCatgory = !isCatgory),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                child: CustomText(
                  text: 'حفظ',
                  fontSize: 18,
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
              ),
            ),
        
        // TextButton(
        //   onPressed: () => Navigator.pop(context),
        //   child: const Text('Cancel'),
        // ),
        // TextButton(
        //   onPressed: () => Navigator.pop(context, true),
        //   child: const Text('OK'),
        // ),
      ],
    );
  }
}


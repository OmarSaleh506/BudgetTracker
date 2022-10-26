import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    final OnSelected selected = ((index, instance) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Select $index, toggle ${instance.labels[index]}')));
    });

    List<bool> isCardEnabled = [];

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
        title: Text('Add',
        style: TextStyle(color: Colors.black, 
        fontSize: 20,
        fontWeight: FontWeight.bold),
      )
      ),
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
          labels: const ['Income', 'Spending'],
             icons: const [
            Icon(Icons.call_made, color: Color(0xff21AA93),),
            Icon(Icons.call_received, color: Color(0xffFA6161),),
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(child: Column(
                    
                    children: [
                      Card( 
                         child:
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: Icon(Icons.wifi, color: Colors.black,))),
                          Text('Internet', style: TextStyle(fontSize: 10),
                          ),
                      // selected
                    ],
                  )),
                ],
              ),
            ),
            CustomTextField(
              text: 'Amount',
              hint: '2000',
              onSave: ((value) {}),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              text: 'Transaction Name',
              hint: 'Rent',
              onSave: ((value) {}),
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
              onDateChange: (date) {},
            ),


            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: 311,
              child: ElevatedButton(
                onPressed: (() {}),
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
            SizedBox(height: 50,)
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final OnSelected selected = ((index, instance) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Select $index, toggle ${instance.labels[index]}')));
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
              height: 40,
            ),
            CustomText(text: 'Category'),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                // loop through the category constants
                Card(
                  child: Icon(Icons.health_and_safety),
                ),
                Card(
                  child: Icon(Icons.wifi),
                )
              ],
            ),
            SizedBox(
              height: 40,
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
              height: 40,
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

            // Row(
            //   children: [
            //     Text('Date'),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Text('Time'),
            //   ],
            // ),

            // Row(
            //   children: [
            //     Text('Date Picker'),

            //     SizedBox(
            //       width: 50,
            //     ),
            //     Text('Time Picker'),
            //   ],
            // ),

            SizedBox(
              height: 60,
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
          ]),
        ),
      ),
    );
  }
}

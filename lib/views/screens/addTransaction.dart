import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          title: Text('Add'),
        ),
      body: Container(
        child: Column(children: [
          Row(children: [
            // buttons
            Text('income'),
            SizedBox(width: 8,),
            Text('spending'),
          ],),

          Text('Category'),
          Row(children: [
            // loop through the category constants
            Card(child: Icon(Icons.health_and_safety) ,),
            Card(child: Icon(Icons.wifi) ,)
          ],),
          Text('Amount'),
         TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '2000...',
                    ),),

           Text('Transaction Name'),
         TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Rent...',
                    ),),

          Row(children: [
            Text('Date'),
            SizedBox(width: 50,),
            Text('Time'),
          ],),


            Row(children: [
            Text('Date Picker'),
            SizedBox(width: 50,),
            Text('Time Picker'),
          ],),



        ]),
    
      ),
    );
  }
}
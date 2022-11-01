import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/categories.dart';
import '../../../controllers/addTransactionController.dart';
import '../../../models/transactionModel.dart';
import '../../../providers/db_provider.dart';
import '../../widgets/customText.dart';
import '../../../constants/colors.dart';
import 'package:fk_toggle/fk_toggle.dart';
import '../../widgets/number_pad.dart';
import '../home.dart';

class AddTransactionCatgory extends StatefulWidget {

  @override
  State<AddTransactionCatgory> createState() => _AddTransactionCatgoryState();
}

class _AddTransactionCatgoryState extends State<AddTransactionCatgory> {
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
               Container(
                height: 500,
                width: 250,
        child: GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              // mainAxisSpacing: 2,
              // crossAxisSpacing: 2,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              isCardEnabled.add(false);
              final data = categories[index];
              return GestureDetector(
                  onTap: () {
                    // _addTransactionController
                    //     .updateSelectedCategory(data.name ?? '');
                    isCardEnabled.replaceRange(0, isCardEnabled.length, [
                      for (int i = 0; i < isCardEnabled.length; i++) false
                    ]);
                    isCardEnabled[index] = true;
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        child: Card(
                          color: isCardEnabled[index]
                              ? Color(0xff1C6DD0)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: data.icon,
                          ),
                        ),
                      ),
                      CustomText(
                        text: data.name ?? '',
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        alignment: Alignment.center,
                      )
                    ],
                  ));
            }),
      ),
          TextFormField(
          textAlign: TextAlign.right,
          controller: _nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'اسم العملية',
          ),
        ),
                
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
                controller: _amountController,
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
              _amountController.text = _amountController.text
                  .substring(0, _amountController.text.length - 1);
            },
            // do something with the input numbers
            onSubmit: () {
              debugPrint('Your code: ${_amountController.text}');
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text(
                          "You code is ${_amountController.text}",
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




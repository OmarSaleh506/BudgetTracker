import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/categories.dart';
import '../../constants/input_formatter.dart';
import '../../controllers/addTransactionController.dart';
import '../../models/transactionModel.dart';
import '../../providers/db_provider.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  List<bool> isCardEnabled = [];
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    final AddTransactionController _addTransactionController =
        Get.put(AddTransactionController());
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
    final List<String> _transactionTypes = ['دخل', 'صرف'];

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
          type: _addTransactionController.transactionType.isNotEmpty
              ? _addTransactionController.transactionType
              : _transactionTypes[0],
          name: _nameController.text,
          amount: _amountController.text,
          category: _addTransactionController.selectedCategory.isNotEmpty
              ? 'أخرى'
              : _addTransactionController.selectedCategory,
          image: _addTransactionController.selectedImage.isNotEmpty
              ? "lib/constants/goalsIcons/plus.svg"
              : _addTransactionController.selectedImage,
        );
        await DatabaseProvider.insertTransaction(transactionModel);
        Get.to(() => HomeScreen());
        print("this is amount ${transactionModel.amount}");
        print("this is name ${transactionModel.name}");
        print("this is type ${transactionModel.type}");
        print("this is category ${transactionModel.category}");
      }
    }

    final OnSelected selected = ((index, instance) {
      _addTransactionController.changeTransactionType((instance.labels[index]));
    });

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.to(HomeScreen());
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'إضافة',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 50,
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
            CustomText(text: 'تصنيف'),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    isCardEnabled.add(false);
                    final data = categories[index];
                    return GestureDetector(
                        onTap: () {
                          _addTransactionController
                              .updateSelectedCategory(data.name ?? '');
                          _addTransactionController
                              .updateSelectedImage(data.icon ?? '');
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
                                    ? darkBlueColor
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: SvgPicture.asset(data.icon ?? ""),
                                ),
                              ),
                            ),
                            CustomText(
                              text: data.name ?? '',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              alignment: Alignment.center,
                            )
                          ],
                        ));
                  }),
            ),
            Column(
              children: [
                CustomText(
                  text: 'إضافة عملية',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _amountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '00.00',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _nameController,
              text: 'اسم العملية',
              hint: 'كريم...',
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
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
                  text: 'أضف',
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

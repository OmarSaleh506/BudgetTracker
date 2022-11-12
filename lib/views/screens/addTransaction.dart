import 'dart:async';

import 'package:budget_tracker/controllers/home_controlle.dart';
import 'package:budget_tracker/routes/routes.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/categories.dart';
import '../../constants/input_formatter.dart';
import '../../controllers/addTransactionController.dart';
import '../../models/transactionModel.dart';
import '../../providers/db_provider.dart';
import '../../views/widgets/customText.dart';
import '../../constants/colors.dart';
import '../widgets/customTextField.dart';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:budget_tracker/constants/colors.dart';

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
        Get.find<AddTransactionController>();
    final HomeController _homeController = Get.find<HomeController>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
    final List<String> _transactionTypes = ['دخل', 'صرف'];

    final DateTime now = DateTime.now();

    // alert dialog after transaction added
    void _openCustomDialog(BuildContext context) {
      showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            Timer(Duration(milliseconds: 1000), () {
              // Get.to(() => HomeScreen());
              //Get.toNamed(Routes.homeScreen);

              print('in dialog');
            });
            return ScaleTransition(
                scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                child: FadeTransition(
                    opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                    child: AlertDialog(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'lib/constants/icons/done.png',
                            height: 164,
                            width: 164,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'تم الإضافة بنجاح',
                            style: TextStyle(color: detailColor),
                          ),
                        ],
                      ),
                    )));
          },
          transitionDuration: Duration(milliseconds: 200),
          barrierDismissible: false,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return Container();
          });
    }

    _addTransaction() async {
      if (_nameController.text.isEmpty || _amountController.text.isEmpty) {
        Get.snackbar('مطلوب', 'جميع الحقول مطلوبة',
            backgroundColor: Colors.red.shade300);
      } else {
        final TransactionModel transactionModel = TransactionModel(
          id: DateTime.now().toString(),
          type: _addTransactionController.transactionType.isNotEmpty
              ? _addTransactionController.transactionType
              : _transactionTypes[0],
          name: _nameController.text,
          amount: _amountController.text,
          category: _addTransactionController.selectedCategory,
          image: _addTransactionController.selectedImage.isNotEmpty
              ? _addTransactionController.selectedImage
              : "lib/constants/goalsIcons/plus.svg",
        );
        await DatabaseProvider.insertTransaction(transactionModel);
        print(
            "this is for impty ${_addTransactionController.transactionType.isNotEmpty}");
        // Get.to(() => HomeScreen());
        //_openCustomDialog(context);
        Get.snackbar('نجاح', 'تم اضافه العملية',
            backgroundColor: Colors.greenAccent,
            snackPosition: SnackPosition.BOTTOM);
        Get.offNamed(Routes.homeScreen);

        print("this is amount ${transactionModel.amount}");
        print("this is name ${transactionModel.name}");
        print("this is type ${transactionModel.type}");
        print("this is category ${transactionModel.category}");
      }
    }

    final OnSelected selected = ((index, instance) async {
      _addTransactionController.changeTransactionType((instance.labels[index]));

      final data = _addTransactionController.transactionType == "صرف"
          ? expenseCategories[index]
          : incomeCategories[index];
      await _addTransactionController.updateSelectedCategory(data.name ?? '');
      await _addTransactionController.updateSelectedImage(data.icon ?? '');
      setState(() {});
    });

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
         resizeToAvoidBottomInset : false,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.homeScreen);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text(
              'إضافة',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            )),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 5.h,
              ),
              FkToggle(
                  width: 26.w,
                  height: 3.5.h,
                  cornerRadius: 29,
                  selectedColor: Colors.white,
                  backgroundColor: Colors.grey.shade300,
                  enabledElementColor: Colors.black,
                  disabledElementColor: Colors.grey,
                  labels: _transactionTypes,
                  fontSize: 12.sp,
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
                height: 3.h,
              ),
              CustomText(text: 'تصنيف', fontSize: 10.sp,),
              SizedBox(
                height: 0.8.h,
              ),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 0,
                    ),
                    itemCount:
                        _addTransactionController.transactionType == "صرف"
                            ? expenseCategories.length
                            : incomeCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      isCardEnabled.add(false);
                      final data =
                          _addTransactionController.transactionType == "صرف"
                              ? expenseCategories[index]
                              : incomeCategories[index];
                      return GestureDetector(
                          onTap: () {
                            _addTransactionController
                                .updateSelectedCategory(data.name ?? '');
                            _addTransactionController
                                .updateSelectedImage(data.icon ?? '');
                            isCardEnabled.replaceRange(
                                0, isCardEnabled.length, [
                              for (int i = 0; i < isCardEnabled.length; i++)
                                false
                            ]);
                            isCardEnabled[index] = true;
                            setState(() {});
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 6.h,
                                width: 14.w,
                                child: Card(
                                  color: isCardEnabled[index]
                                      ? darkBlueColor
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      data.icon ?? "",
                                      color: isCardEnabled[index]
                                          ? lightModeScaffoldBgCle
                                          : Colors.black,
                                      height: 2.5.h,
                                    ),
                                  ),
                                ),
                              ),
                              CustomText(
                                text: data.name ?? '',
                                fontSize: 10.sp,
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
                    fontSize: 10.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    inputFormatters: [
                      DecimalTextInputFormatter(decimalRange: 2)
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: '00.00',
                      hintStyle: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: _nameController,
                text: 'اسم العملية',
                hint: 'كريم...',
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 7.h,
                width: 70.w,
                child: ElevatedButton(
                  onPressed: () async {
                    _addTransaction();

                    await _homeController.getTransactions();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  child: CustomText(
                    text: 'أضف',
                    fontSize: 15.sp,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              )
            ]),
          ),
        ),
      ),
    );
  }
}

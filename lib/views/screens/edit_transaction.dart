import 'package:budget_tracker/controllers/addTransactionController.dart';
import 'package:budget_tracker/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/input_formatter.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/home_controlle.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider.dart';
import '../../providers/db_provider_goals.dart';
import '../../routes/routes.dart';
import '../widgets/custom_edit_goal.dart';
import '../widgets/home_Screen/custom_text.dart';

class EditTransaction extends StatefulWidget {
  final TransactionModel? transactionModel;

  EditTransaction({Key? key, this.transactionModel}) : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final AddTransactionController addTransactionController =
      Get.put(AddTransactionController());
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _tranNameController = TextEditingController();
  final List<String> _transactionTypes = ['دخل', 'صرف'];
  final HomeController _homeController = Get.find<HomeController>();
  String? _transactionType;
  String? _selectedCategory;
  String? _selectedImage;

  @override
  void initState() {
    super.initState();
    setState(() {
      _amountController.text = widget.transactionModel!.amount!;
      _tranNameController.text = widget.transactionModel!.name!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
           physics: ClampingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.expand_less,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff1C6DD0),
                  child: SvgPicture.asset(
                    "${widget.transactionModel!.image}",
                    color: lightModeScaffoldBgCle,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '${widget.transactionModel!.category}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFialedEditGoal(
                    text: "اسم العملية",
                    hint: widget.transactionModel!.name,
                    controller: _tranNameController),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFialedEditGoal(
                  text: "المبلغ",
                  hint: widget.transactionModel!.amount,
                  controller: _amountController,
                  inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 5.8.h,
                  width: 40.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(_tranNameController.text);
                      print(_amountController.text);
                      _updateTrans();
                      await _homeController.getTransactions();
                      Get.offNamed(Routes.dashboardScreen);
                      Get.back();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xffEEEEEE)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextGoal(
                          text: 'تعديل العملية',
                          fontSize: 13.sp,
                          color: darkBlueColor,
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        SvgPicture.asset('images/pencil.svg')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                 height: 5.8.h,
                  width: 40.h,
                  child: TextButton(
                    onPressed: () async {
                      await _homeController.deleteTransaction(
                          widget.transactionModel!.id!);
                      await _homeController.getTransactions();
                      Get.back();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xffFFFFFF)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextGoal(
                          text: 'حذف العملية',
                          fontSize: 13.sp,
                          color: expenseColor,
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        SvgPicture.asset('images/trash.svg'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _updateTrans() async {
    if (_tranNameController.text.isEmpty || _amountController.text.isEmpty) {
      Get.snackbar(
        'Required',
        'All fields are requried',
      );
    } else {
      final TransactionModel transactionModel = TransactionModel(
        id: widget.transactionModel!.id!,
        name: _tranNameController.text,
        amount: _amountController.text,
      );
      await _homeController.updateTransaction(transactionModel);

    }
  }
}

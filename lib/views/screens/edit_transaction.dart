import 'package:budget_tracker/controllers/addTransactionController.dart';
import 'package:budget_tracker/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/home_controlle.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider.dart';
import '../../providers/db_provider_goals.dart';
import '../widgets/custom_edit_goal.dart';
import '../widgets/home_Screen/custom_text.dart';

class EditTransaction extends StatefulWidget {
  final TransactionModel transactionModel;

  EditTransaction({Key? key, required this.transactionModel}) : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final AddTransactionController addTransactionController =
  Get.put(AddTransactionController());
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _tranNameController = TextEditingController();
  final List<String> _transactionTypes = ['دخل', 'صرف'];
  final HomeController _homeController= Get.find<HomeController>();
  String? _transactionType;
  String? _selectedCategory;
  String? _selectedImage;


  @override
  void initState() {
    super.initState();
    setState(() {
      _amountController.text = widget.transactionModel.amount!;
      _tranNameController.text = widget.transactionModel.name!;



    });
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.expand_less,
          color: Colors.black,
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xff1C6DD0),
          child: SvgPicture.asset(
            "${widget.transactionModel.image}",
            color: lightModeScaffoldBgCle,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${widget.transactionModel.category}',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              letterSpacing: 0.5),
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFialedEditGoal(
            text: "اسم العملية",
            hint: widget.transactionModel.name,
            controller: _tranNameController),
        SizedBox(
          height: 20,
        ),
        CustomTextFialedEditGoal(
            text: "المبلغ",
            hint: widget.transactionModel.amount,
            controller: _amountController),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 58,
          width: 351,
          child: ElevatedButton(
            onPressed: () async {
              print(_tranNameController.text);
              print(_amountController.text);
            _updateTrans();
              await _homeController.getTransactions();
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
                  fontSize: 18,
                  color: darkBlueColor,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset('images/pencil.svg')
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 58,
          width: 351,
          child: TextButton(
            onPressed: () async {
              await DatabaseProvider.deleteTransaction(widget.transactionModel.id!);
              Get.back();
              await _homeController.getTransactions();
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
                  fontSize: 18,
                  color: expenseColor,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset('images/trash.svg'),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
    ),
    );


  }

  _updateTrans() async {
    if (_tranNameController.text.isEmpty ||
        _amountController.text.isEmpty) {
      Get.snackbar(
        'Required',
        'All fields are requried',
      );
    } else {
      final TransactionModel transactionModel = TransactionModel(
        id: widget.transactionModel.id!,
        name: _tranNameController.text,
        amount: _amountController.text,

      );
      await DatabaseProvider.updateTransaction(transactionModel);
      Get.back();
    }
  }
}

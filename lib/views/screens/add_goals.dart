import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/goal_categories.dart';
import '../../constants/input_formatter.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/goal_controller.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider_goals.dart';
import '../../constants/colors.dart';
import '../../routes/routes.dart';
import '../widgets/home_Screen/custom_TextField.dart';
import '../widgets/home_Screen/custom_text.dart';

class AddGoals extends StatefulWidget {
  AddGoals({super.key});

  @override
  State<AddGoals> createState() => _AddGoalsState();
}

class _AddGoalsState extends State<AddGoals> {
  List<bool> isCardEnabled = [];
  @override
  Widget build(BuildContext context) {
    final AddGoalController addTransactionController = Get.find();
    final GoalsController goalController = Get.find();

    final TextEditingController goalAmountController = TextEditingController();
    final TextEditingController savedAmountController = TextEditingController();

    final DateTime now = DateTime.now();

    _addGoalsTransaction() async {
      if (goalAmountController.text.isEmpty ||
          savedAmountController.text.isEmpty) {
        Get.snackbar(
          'مطلوب',
          'جميع الحقول مطلوبة',
            backgroundColor: Colors.red.shade300
        );
      } else if (int.parse(savedAmountController.text) >
          int.parse(goalAmountController.text)) {
        Get.snackbar(
          'خطأ',
          'المبلغ المدخر اعلى من مبلغ الهدف',
          backgroundColor: Colors.red.shade300
        );
      } 
      else {
        final GoalModel goalModel = GoalModel(
            id: DateTime.now().toString(),
            goalAmount: goalAmountController.text,
            savedAmount: savedAmountController.text,
            goalAmountLeft: '0.0',
            category: addTransactionController.selectedCategory,
            image: addTransactionController.selectedImage.isNotEmpty
                ? addTransactionController.selectedImage
                : "lib/constants/goalsIcons/plus.svg",
            color: addTransactionController.selectedColor.isNotEmpty
                ? addTransactionController.selectedColor
                : "0xff1C6DD0");
        await DatabaseProviderGoals.insertGoal(goalModel);
        Get.toNamed(Routes.homeScreen);
        Get.back();
        print("this is id ${goalModel.id}");
        print("this is goalAmount ${goalModel.goalAmount}");
        print("this is savedAmount ${goalModel.savedAmount}");
        print("this is goalAmountLeft ${goalModel.goalAmountLeft}");
        print("this is category ${goalModel.category}");
        print("this is image ${goalModel.image}");
        print("this is color ${goalModel.color}");
      }
    }

    return Scaffold(
      body: Padding(

        padding: EdgeInsets.all(3.w),
        child: Column(
          children: [
            const Icon(
              Icons.expand_less,
              color: Colors.black,
            ),
            CustomTextGoal(text: 'هدفك'),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(3.w),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemCount: categoriesGoals.length,
                  itemBuilder: (BuildContext context, int index) {
                    isCardEnabled.add(false);
                    final data = categoriesGoals[index];
                    return GestureDetector(
                      onTap: () {
                        addTransactionController
                            .updateSelectedCategory(data.name ?? '');
                        addTransactionController
                            .updateSelectedImage(data.image ?? '');
                        addTransactionController
                            .updateSelectedColor(data.containerColor ?? "");
                        isCardEnabled.replaceRange(0, isCardEnabled.length, [
                          for (int i = 0; i < isCardEnabled.length; i++) false
                        ]);
                        isCardEnabled[index] = true;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                            width: 11.w,
                            child: Card(
                              color: isCardEnabled[index]
                                  ? Color(0xffFF5678)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.w)),
                              child: Center(
                                child: SvgPicture.asset(
                                  data.image ?? '',
                                  color: isCardEnabled[index]
                                      ? lightModeScaffoldBgCle
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          CustomTextGoal(
                            text: data.name ?? '',
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal,
                            alignment: Alignment.center,
                          )
                        ],

                      ),
                    );
                  }),
            ),
            Column(
              children: [
                CustomTextFieldGoal(
                  controller: goalAmountController,
                  text: 'المبلغ',
                  hint: '200...',
                  inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldGoal(
                  controller: savedAmountController,
                  text: 'أدخرت',
                  hint: '200...',
                  inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 7.h,
                  width: 81.w,
                  child: ElevatedButton(
                    onPressed: () async {
                      _addGoalsTransaction();
                      await goalController.getTransactions();
                      Get.back();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w),
                        ))),
                    child: CustomTextGoal(
                      text: 'أضف',
                      fontSize: 12.sp,
                      color: Colors.white,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

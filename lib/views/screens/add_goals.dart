import 'package:budget_tracker/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants/goal_categories.dart';
import '../../controllers/addTrans_goal_controller.dart';
import '../../controllers/add_goal_controller.dart';
import '../../models/goalModel.dart';
import '../../providers/db_provider_goals.dart';
import '../../constants/colors.dart';
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
    final AddGoalController _addTransactionController =
        Get.put(AddGoalController());
    final GoalsController _goalController = Get.find<GoalsController>();

    final TextEditingController goalAmountController = TextEditingController();
    // final TextEditingController goalAmountLeftController =
    //     TextEditingController();

    final TextEditingController savedAmountController = TextEditingController();
    final DateTime now = DateTime.now();
    // final double goalLeft =
    //     double.parse((goalAmountController.text).toString());
    // final double goalLeft2 =
    //     double.parse((savedAmountController.text).toString());
    // final double totalGoalLeft = goalLeft - goalLeft2;
    // final String finalTotalGoalLeft = totalGoalLeft.toString();
    _addGoalsTransaction() async {
      if (goalAmountController.text.isEmpty ||
          savedAmountController.text.isEmpty) {
        Get.snackbar(
          'Required',
          'All fields are requried',
        );
      } else {
        final GoalModel transactionModel = GoalModel(
            id: DateTime.now().toString(),
            goalAmount: goalAmountController.text,
            savedAmount: savedAmountController.text,
            goalAmountLeft:'0.0',
            category: _addTransactionController.selectedCategory,
            image: _addTransactionController.selectedImage.isNotEmpty
                ? _addTransactionController.selectedImage
                : "lib/constants/goalsIcons/plus.svg",
            color: _addTransactionController.selectedColor.isNotEmpty
                ? _addTransactionController.selectedColor
                : "0xff1C6DD0");
        await DatabaseProviderGoals.insertGoal(transactionModel);
        Get.to(HomeScreen());
        print("this is id ${transactionModel.id}");
        print("this is goalAmount ${transactionModel.goalAmount}");
        print("this is savedAmount ${transactionModel.savedAmount}");
        print("this is goalAmountLeft ${transactionModel.goalAmountLeft}");
        print("this is category ${transactionModel.category}");
        print("this is image ${transactionModel.image}");
        print("this is color ${transactionModel.color}");
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            children: [
              Icon(
                Icons.expand_less,
                color: Colors.black,
              ),
              CustomTextGoal(text: 'هدفك'),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemCount: categoriesGoals.length,
                    itemBuilder: (BuildContext context, int index) {
                      isCardEnabled.add(false);
                      final data = categoriesGoals[index];
                      return GestureDetector(
                        onTap: () {
                          _addTransactionController
                              .updateSelectedCategory(data.name ?? '');
                          _addTransactionController
                              .updateSelectedImage(data.image ?? '');
                          _addTransactionController
                              .updateSelectedColor(data.containerColor ?? "");
                          isCardEnabled.replaceRange(0, isCardEnabled.length, [
                            for (int i = 0; i < isCardEnabled.length; i++) false
                          ]);
                          isCardEnabled[index] = true;
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Card(
                                color: isCardEnabled[index]
                                    ? Color(0xffFF5678)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: SvgPicture.asset(data.image ?? ''),
                                ),
                              ),
                            ),
                            CustomTextGoal(
                              text: data.name ?? '',
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 38),
                child: Column(
                  children: [
                    CustomTextFieldGoal(
                      controller: goalAmountController,
                      text: 'المبلغ',
                      hint: '200...',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldGoal(
                      controller: savedAmountController,
                      text: 'أدخرت',
                      hint: '200...',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 311,
                      child: ElevatedButton(
                        onPressed: () async {
                          _addGoalsTransaction();
                          Get.back();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        child: CustomTextGoal(
                          text: 'أضف',
                          fontSize: 18,
                          color: Colors.white,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

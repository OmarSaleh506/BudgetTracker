import 'package:budget_tracker/views/screens/add_transaction/add_transaction_amount.dart';
import 'package:budget_tracker/views/screens/add_transaction/add_transaction_catgory.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:budget_tracker/views/widgets/customTextField.dart';
import 'package:budget_tracker/views/widgets/number_pad.dart';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'constants/theme.dart';
import '../../providers/db_provider.dart';
import 'controllers/addTransactionController.dart';
import 'models/transactionModel.dart';
import 'providers/db_provider_goals.dart';
import 'views/widgets/customText.dart';
import '../../constants/categories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();

  await DatabaseProvider.initDb();
  await DatabaseProviderGoals.initDb();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: AddTransactionCatgory(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  List<bool> isCardEnabled = [];
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
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
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
      body: Container(
        child: GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
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
      
      );
   
  }
}
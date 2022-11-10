import 'package:budget_tracker/routes/bindings/add_transaction_binding.dart';
import 'package:budget_tracker/routes/bindings/goal_binding.dart';
import 'package:budget_tracker/routes/bindings/home_binding.dart';
import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/add_goals.dart';
import 'package:budget_tracker/views/screens/dashboardScreen.dart';
import 'package:budget_tracker/views/screens/edit_goals.dart';
import 'package:budget_tracker/views/screens/edit_transaction.dart';
import 'package:budget_tracker/views/screens/first_page.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:budget_tracker/views/screens/second_page.dart';
import 'package:budget_tracker/views/screens/start_page.dart';
import 'package:budget_tracker/views/screens/third_page.dart';
import 'package:budget_tracker/views/widgets/home_Screen/all_goals.dart';
import 'package:budget_tracker/views/widgets/home_Screen/goals.dart';
import 'package:get/get.dart';

import 'bindings/chart_binding.dart';

class AppRoute {
  // initialRoute
  static const home = Routes.splashScreen;


  //GetPage

  static final routes = [
    GetPage(
      name: Routes.homeScreen, 
      page: () =>  HomeScreen(),
      bindings: [HomeBinding(),GoalBinding()]),
       GetPage(
      name: Routes.addTransaction, 
      page: () =>  AddTransaction(),
      bindings: [AddTransactionBinding(),HomeBinding()]),
      // GetPage(
      // name: Routes.editTransaction, 
      // page: () =>  EditTransaction(),
      // binding: AddTransactionBinding(),
      // ),
      GetPage(
      name: Routes.splashScreen, 
      page: () =>  StartPage()),
      GetPage(
      name: Routes.firstPage, 
      page: () =>  FirstPage()),
      GetPage(
      name: Routes.secondPage, 
      page: () =>  SecondPage()),
      GetPage(
      name: Routes.thirdPage, 
      page: () =>  ThirdPage()),
      GetPage(
      name: Routes.addGoal, 
      page: () =>  AddGoals(),
      
      ),
      GetPage(
      name: Routes.goalsPage, 
      page: () =>  Goals()),
      // GetPage(
      // name: Routes.editGoal, 
      // page: () =>  EditGoal()),
      GetPage(
      name: Routes.dashboardScreen, 
      page: () =>  DashboardScreen(),
      binding: ChartBinding()),

      
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
  static const addTransaction ='/addTransaction';
  static const editTransaction ='/editTransaction';
  static const splashScreen ='/splashScreen';
  static const firstPage ='/firstPage';
  static const secondPage ='/secondPage';
  static const thirdPage ='/thirdPage';
  static const dashboardScreen ='/dashboardScreen';
  static const addGoal ='/addGoal';
  static const editGoal ='/editGoal';
  static const goalsPage ='/goalsPage';
}

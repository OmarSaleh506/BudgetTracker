import 'package:budget_tracker/views/screens/addTransaction.dart';
import 'package:budget_tracker/views/screens/home.dart';
import 'package:get/get.dart';

class AppRoute {
  // initialRoute
  static const home = Routes.homeScreen;


  //GetPage

  static final routes = [
    GetPage(
      name: Routes.homeScreen, 
      page: () =>  HomeScreen()),
       GetPage(
      name: Routes.addTransaction, 
      page: () =>  AddTransaction()),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
  static const addTransaction ='/addTransaction';

}

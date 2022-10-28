import 'package:flutter/material.dart';

final List<Goal_Category> categoriesGoals = [
  Goal_Category(
      name: 'Home',
      icon: Image.asset(
        "lib/constants/goalsIcons/house.png",
        color: Colors.black,
      )),
  Goal_Category(
      name: 'Car', icon: Image.asset("lib/constants/goalsIcons/car.png")),
  Goal_Category(
      name: 'New Studies',
      icon: Image.asset("lib/constants/goalsIcons/studies.png")),
  Goal_Category(
      name: 'Marriage',
      icon: Image.asset("lib/constants/goalsIcons/marriage.png")),
  Goal_Category(
      name: 'Add', icon: Image.asset("lib/constants/goalsIcons/plus.png")),
];

class Goal_Category {
  final String? name;
  final Image? icon;

  Goal_Category({this.name, this.icon});
}

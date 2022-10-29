import 'package:flutter/material.dart';

final List<Goal_Category> categoriesGoals = [
  Goal_Category(
      name: 'Home',
      icon: Image.asset(
        "lib/constants/goalsIcons/house.png",
        color: Colors.black,
        fit: BoxFit.fill,
      )),
  Goal_Category(
    name: 'Car',
    icon: Image.asset(
      "lib/constants/goalsIcons/car.png",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
  Goal_Category(
    name: 'New Studies',
    icon: Image.asset(
      "lib/constants/goalsIcons/studies.png",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
  Goal_Category(
    name: 'Marriage',
    icon: Image.asset(
      "lib/constants/goalsIcons/marriage.png",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
  Goal_Category(
    name: 'Add',
    icon: Image.asset(
      "lib/constants/goalsIcons/plus.png",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
];

class Goal_Category {
  final String? name;
  final Image? icon;

  Goal_Category({this.name, this.icon});
}

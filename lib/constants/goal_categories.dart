import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<Goal_Category> categoriesGoals = [
  Goal_Category(
      name: 'سكن',
      image: SvgPicture.asset(
        "lib/constants/goalsIcons/house.svg",
        color: Colors.black,
        fit: BoxFit.fill,
      )),
  Goal_Category(
    name: 'سيارة',
    image: SvgPicture.asset(
      "lib/constants/goalsIcons/car.svg",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
  Goal_Category(
    name: 'تعليم',
    image: SvgPicture.asset(
      "lib/constants/goalsIcons/car.svg",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
  Goal_Category(
    name: 'زواج',
    image: SvgPicture.asset(
      "lib/constants/goalsIcons/marriage.svg",
      color: Colors.black,
      fit: BoxFit.fill,
    ),
  ),
  Goal_Category(
    name: 'أخرى',
    image: SvgPicture.asset(
      "lib/constants/goalsIcons/plus.svg",
      color: Colors.black,
      fit: BoxFit.contain,
    ),
  ),
];

class Goal_Category {
  final String? name;
  final SvgPicture? image;

  Goal_Category({this.name, this.image});
}

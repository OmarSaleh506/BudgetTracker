import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<Category> expenseCategories = [
  Category(
    name: 'صحه',
    icon: "lib/constants/icons/health.svg",
  ),
  Category(
    name: 'نقل',
    icon: "lib/constants/icons/transportation.svg",
  ),
  Category(
    name: 'سفر',
    icon: "lib/constants/icons/Airplane.svg",
  ),
  Category(
    name: 'مقاضي',
    icon: "lib/constants/icons/grocery.svg",
  ),
  Category(
    name: 'اخرى',
    icon: "lib/constants/icons/other.svg",
  )
];


final List<Category> incomeCategories = [
  Category(
    name: 'راتب',
    icon: "lib/constants/icons/salary.svg",
  ),
  Category(
    name: 'عقار',
    icon: "lib/constants/icons/realEstate.svg",
  ),
  Category(
    name: 'حوالات',
    icon: "lib/constants/icons/moneytransform.svg",
  ),
  Category(
    name: 'عائلة',
    icon: "lib/constants/icons/family.svg",
  ),
  Category(
    name: 'استثمار',
    icon: "lib/constants/icons/invesment.svg",
  )
];

class Category {
  final String? name;
  final String? icon;
  Color? color;

  Category({this.name, this.icon, this.color});
}
// Category(
  //   name: 'اتصالات',
  //   icon: "lib/constants/icons/internet.svg",
  // ),
  // Category(
  //   name: 'سكن',
  //   icon: "lib/constants/icons/house.svg",
  // ),
  // Category(
  //   name: 'دراسة',
  //   icon: "lib/constants/icons/GraduationCap.svg",
  // ),
  // Category(
  //   name: 'عائلة',
  //   icon: "lib/constants/icons/family.svg",
  // ),
  // Category(
  //   name: 'مطاعم',
  //   icon: "lib/constants/icons/cafe.svg",
  // ),
  // Category(
  //   name: 'حوالات',
  //   icon: "lib/constants/icons/moneytransform.svg",
  // ),
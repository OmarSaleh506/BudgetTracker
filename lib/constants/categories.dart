import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<Category> categories = [
  Category(
    name: 'صحه',
    icon: "lib/constants/icons/health.svg",
  ),
  Category(
    name: 'سفر',
    icon: "lib/constants/icons/Airplane.svg",
  ),
  Category(
    name: 'نقل',
    icon: "lib/constants/icons/transportation.svg",
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

class Category {
  final String? name;
  final String? icon;
  Color? color;

  Category({this.name, this.icon, this.color});
}

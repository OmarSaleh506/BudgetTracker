import 'package:flutter/material.dart';
import 'package:budget_tracker/constants/colors.dart';

class Categories {
  static List<Data> data = [
    Data(name: 'Health & care', amount: 40, color: const Color(0xff0e3768)),
    Data(name: 'Internet & Phone', amount: 30, color: const Color(0xfff8b250)),
    Data(name: 'Transportation', amount: 15, color: Color(0xffFF5678)),
    Data(name: 'Others', amount: 15, color: const Color(0xff146658)),
  ];
}

class Data {
  final String name;

  final double amount;

  final Color color;

  Data({required this.name, required this.amount, required this.color});
}
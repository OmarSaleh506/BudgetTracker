
import 'package:budget_tracker/constants/categories.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/category.dart';



List<PieChartSectionData> getSection(int touchedIndex)=> Categories.data.asMap()
    .map<int,PieChartSectionData>((index, data) {
      final isTouched =index== touchedIndex;
      final double fontSize= isTouched? 20 :14;
      final value= PieChartSectionData(
        radius: 120,

        color: data.color,
        value: data.amount ,
        title: "SR${data.amount}",
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),),
      );
return MapEntry(index, value);

}).values.toList();
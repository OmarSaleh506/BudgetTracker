import 'package:flutter_svg/svg.dart';

class GoalModel {
  final String? id;
  final String? category;
  final String? image;
  final String? goalAmount;
  final String? goalAmountLeft;
  final String? savedAmount;
  final String? date;
  final String? time;
  // final String? color;

  GoalModel({
    this.id,
    this.goalAmountLeft,
    this.category,
    this.goalAmount,
    this.savedAmount,
    this.date,
    this.time,
    this.image,
    // this.color
  });
// color: json['color'],
  GoalModel fromJson(Map<String, dynamic> json) => GoalModel(
        id: json['id'],
        image: json['image'],
        goalAmount: json['goalAmount'],
        goalAmountLeft: json['goalAmountLeft'],
        savedAmount: json['savedAmount'],
        date: json['date'],
        time: json['time'],
        category: json['category'],
      );
// 'color': color,
  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
        'goalAmount': goalAmount,
        'goalAmountLeft': goalAmountLeft,
        'savedAmount': savedAmount,
        'date': date,
        'time': time,
        'category': category,
      };
}

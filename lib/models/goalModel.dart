class GoalModel {
  final String? id;
  final String? category;
  final String? goalAmount;
  final String? savedAmount;
  final String? date;
  final String? time;

  GoalModel({
    this.id,
    this.category,
    this.goalAmount,
    this.savedAmount,
    this.date,
    this.time,
  });

  GoalModel fromJson(Map<String, dynamic> json) => GoalModel(
        id: json['id'],
        goalAmount: json['goalAmount'],
        savedAmount: json['savedAmount'],
        date: json['date'],
        time: json['time'],
        category: json['category'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'goalAmount': goalAmount,
        'savedAmount': savedAmount,
        'date': date,
        'time': time,
        'category': category,
      };
}

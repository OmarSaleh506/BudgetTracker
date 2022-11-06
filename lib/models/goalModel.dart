class GoalModel {
  final String? id;
  final String? category;
  final String? image;
  final String? goalAmount;
  late final String? goalAmountLeft;
  final String? savedAmount;
  final String? color;

  GoalModel({
    this.id,
    this.goalAmountLeft,
    this.category,
    this.goalAmount,
    this.savedAmount,
    this.image,
    this.color,
  });

  GoalModel fromJson(Map<String, dynamic> json) => GoalModel(
        id: json['id'],
        color: json['color'],
        image: json['image'],
        goalAmount: json['goalAmount'],
        goalAmountLeft: json['goalAmountLeft'],
        savedAmount: json['savedAmount'],
        category: json['category'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'color': color,
        'image': image,
        'goalAmount': goalAmount,
        'goalAmountLeft': goalAmountLeft,
        'savedAmount': savedAmount,
        'category': category,
      };
}

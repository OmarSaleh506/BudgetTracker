class TransactionModel {
  final String? id;
  final String? type;
  final String? category;
  final String? amount;
  final String? name;
  final String? image;

  TransactionModel(
      {this.id, this.type, this.category, this.name, this.amount, this.image});

  TransactionModel fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json['id'],
        type: json['type'],
        amount: json['amount'],
        name: json['name'],
        category: json['category'],
        image: json['image'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'name': name,
        'amount': amount,
        'category': category,
        'image': image,
      };
}

class TransactionModel {
  
  final String? id;
  final String? type;
  final String? category;
  final String? amount;
  final String? name;
  final String? date;
  

  TransactionModel({
    this.id,
    this.type,
    this.category,
    this.name,
    this.amount,
    this.date,
  });

  TransactionModel fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'],
    type: json['type'],
    amount: json['amount'],
    name: json['name'],
    date: json['date'],
    category: json['category'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'type': type,
    'name': name,
    'amount': amount,
    'date': date,
    'category': category,
  };




}
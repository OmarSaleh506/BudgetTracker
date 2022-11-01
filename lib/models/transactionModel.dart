class TransactionModel {
  
  final String? id;
  final String? type;
  final String? category;
  final String? amount;
  final String? name;

  

  TransactionModel({
    this.id,
    this.type,
    this.category,
    this.name,
    this.amount,
 
  });

  TransactionModel fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'],
    type: json['type'],
    amount: json['amount'],
    name: json['name'],
    category: json['category'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'type': type,
    'name': name,
    'amount': amount,
    'category': category,
  };




}
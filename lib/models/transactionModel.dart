class TransactionModel {
  
  final String? id;
  final String? type;
  final String? category;
  final String? amount;
  final String? name;
  final String? date;
  final String? time;
  

  TransactionModel({
    this.id,
    this.type,
    this.category,
    this.name,
    this.amount,
    this.date,
    this.time,
  });

  TransactionModel fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'],
    type: json['type'],
    amount: json['amount'],
    name: json['name'],
    date: json['date'],
    time: json['time'],
    category: json['category'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'type': type,
    'name': name,
    'amount': amount,
    'date': date,
    'time': time,
    'category': category,
  };




}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transactionModel.dart';

class chart extends StatelessWidget {

  final List<TransactionModel> myTransactions;
  chart({Key? key, required this.myTransactions})
      : super(key: key);

  List<Map<String, dynamic>> get groupedExpenseTx {
    return List.generate(7, (i) {
      final weekDay = DateTime.now().subtract(Duration(days: i));

      double totalSum = 0;
      for (var tm in myTransactions) {
        if (tm.date == DateFormat.yMd().format(weekDay)) {
          if (tm.type == 'Expense') {
            totalSum += double.parse(tm.amount!);
          }
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalExpense {
    return groupedExpenseTx.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {

    print("total is $totalExpense");
    return Container(child: Text(totalExpense.toString()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/transactionModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/db_provider.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel transactionModel;
  final bool isIncome;
  final String formatAmount;
  TransactionWidget({
    Key? key,
    required this.transactionModel,
    required this.formatAmount,
    required this.isIncome,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
        Card(
            elevation: 0.4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isIncome
                  ? primaryColor
                : expenseColor,
                child: Icon(
                  isIncome
                 ? Icons.keyboard_double_arrow_up
                  : Icons.keyboard_double_arrow_down,
                  color: Colors.white,
                ),
              ),
              title:  Text(
                transactionModel.name!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  letterSpacing: 2
                ),
              ),
              subtitle: Text(
                transactionModel.date!,
                style: TextStyle(
                  color: detailColor,
                  fontSize: 11,
                ),
              ),
              trailing:SizedBox(height: 100,width: 120, child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  Text(
                    formatAmount,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isIncome ?primaryColor :expenseColor,
                        fontSize: 18),
                  ),
                  IconButton(onPressed: () async {
                    await DatabaseProvider.deleteTransaction(transactionModel.id!);
                    // Get.back();
                  }, icon: Icon(
                    Icons.delete,
                    color: expenseColor,),),
                ],
              ),)
            ));
  }
}

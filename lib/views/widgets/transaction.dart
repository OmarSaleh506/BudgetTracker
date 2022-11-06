import 'package:flutter/material.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Card(
        elevation: 0.4,
        child: ListTile(
          leading: SizedBox(
            height: 100,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () async {
                    await DatabaseProvider.deleteTransaction(
                        transactionModel.id!);
                    // Get.back();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: expenseColor,
                  ),
                ),
                Text(
                  formatAmount,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isIncome ? primaryColor : expenseColor,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          title: Text(
            transactionModel.name!,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 2,
            ),
          ),
          trailing: CircleAvatar(
            child: SvgPicture.asset(transactionModel.image!),
          ),
        ));
  }
}

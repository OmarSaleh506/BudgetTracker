import 'package:flutter/material.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/transactionModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionWidget extends StatelessWidget {
  // final TransactionModel transactionModel;
  // TransactionWidget({
  //   Key? key,
  //   required this.transactionModel,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.withOpacity(.3),
                child: Icon(
                  Icons.keyboard_double_arrow_up,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Salary",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                "Today",
                style: TextStyle(
                  color: detailColor,
                  fontSize: 11,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "100SR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff21AA93),
                        fontSize: 18),
                  )
                ],
              ),
            ));
  }
}

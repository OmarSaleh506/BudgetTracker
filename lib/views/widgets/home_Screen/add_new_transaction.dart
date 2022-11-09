import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../screens/addTransaction.dart';

class AddNewTransaction extends StatelessWidget {
  const AddNewTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 280, bottom: 50),
      child: SizedBox(
        width: 84,
        height: 84,
        child: FloatingActionButton.large(
          onPressed: () {
            Get.off(AddTransaction());
          },
          child: const Icon(
            Icons.add,
            color: lightModeScaffoldBgCle,
            size: 35,
          ),
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}

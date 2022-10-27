import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AddGoal extends StatelessWidget {
  const AddGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 15,
            ),
            label: Text(
              'Add Goal',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: lightModeScaffoldBgCle,
              size: 35,
            ),
            backgroundColor: primaryColor,
          ),
        )
      ],
    );
  }
}
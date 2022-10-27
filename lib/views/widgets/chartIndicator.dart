import 'package:flutter/material.dart';

import '../../constants/categories.dart';
import '../../constants/category.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Categories.data
          .map(
            (data) => Container(
            child: buildIndicator(
              color: data.color,
              text: data.name,
              // isSquare: true,
            )),
      )
          .toList(),
    );
  }

  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) =>
      Row(
        children: <Widget>[
          SizedBox(width: 3),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 3,),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          )
        ],
      );
}

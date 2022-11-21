import 'package:flutter/material.dart';

import '../Utils/dimenstion.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final String fontFamily;
  final FontWeight fontWeight;

  const BoldText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 14,
    this.fontFamily = "Avenir Next",
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size == 16 ? Dimensions.font16 : size,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily),
    );
  }
}

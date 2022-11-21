import 'package:flutter/material.dart';

import '../Utils/dimenstion.dart';
import 'bold_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onClick;
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height65 - 3,
      width: Dimensions.width368 - 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          Dimensions.width15,
        ),
      ),
      child: Center(
        child: BoldText(
          text: title,
          color: Colors.white,
          size: Dimensions.font20,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/dimenstion.dart';
import '../../../widgets/bold_text.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          text: title,
          size: Dimensions.font16,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          height: 43,
          width: 368,
          child: Form(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 10),
                focusColor: AppColors.blueColor,
                contentPadding: EdgeInsets.only(
                    top: Dimensions.height5,
                    bottom: Dimensions.height5,
                    left: Dimensions.width10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.height5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/dimenstion.dart';
import 'regular_text.dart';

class SmallCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final IconData? icon;
  final String title;
  final Color? color;

  const SmallCustomAppBar({
    Key? key,
    this.icon,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: AppColors.mainColor,
        ),
      ),
      title: RegularText(
        text: title,
        color: AppColors.mainColor,
      ),
      actions: [
        SizedBox(
          width: Dimensions.height25,
        ),
        Row(
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: color,
                  )
                : Container(),
            SizedBox(
              width: Dimensions.height15,
            ),
          ],
        ),
      ],
    );
  }
}

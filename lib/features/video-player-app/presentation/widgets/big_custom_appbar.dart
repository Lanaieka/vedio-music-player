import 'package:flutter/material.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

import '../Utils/colors.dart';

class BigCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final IconData? firstIcon;
  final IconData? secondIcon;
  final String title;
  final Color? color;

  const BigCustomAppBar({
    Key? key,
    required this.firstIcon,
    required this.secondIcon,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.arrow_back,
        color: AppColors.mainColor,
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
            Icon(
              firstIcon,
              color: color,
            ),
            SizedBox(
              width: Dimensions.height15,
            ),
            Icon(
              secondIcon,
              color: color,
            ),
            SizedBox(
              width: Dimensions.height15,
            ),
          ],
        ),
      ],
    );
  }
}

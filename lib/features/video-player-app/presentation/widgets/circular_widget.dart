import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

import '../Utils/dimenstion.dart';

class CircularIconWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? bgColor;

  const CircularIconWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: Dimensions.height65 - 5,
            width: Dimensions.height65 - 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: bgColor != null ? bgColor : Colors.transparent,
              // image: DecorationImage(
              //   image: AssetImage(imgUrl),
              // ),
              // border: Border.all(
              //   color: bgColor != null ? Colors.transparent : Colors.black,
              // ),
            ),
            child: Column(
              children: [
                SizedBox(
                  // height: 40,
                  // width: 40,
                  child: Image.asset(
                    icon,
                    // color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          RegularText(
            text: title,
            size: Dimensions.height10 + 2,
          ),
        ],
      ),
    );
  }
}

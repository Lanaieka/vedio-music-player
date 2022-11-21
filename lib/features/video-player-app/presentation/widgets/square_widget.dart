import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';
import '../Utils/dimenstion.dart';

class SquareWidget extends StatelessWidget {
  final String title;
  final String? icon;
  final int index;
  final VoidCallback onClick;

  final Color? color;
  final Color? iconColor;
  final String bgImg;
  const SquareWidget({
    Key? key,
    required this.title,
    this.icon,
    required this.index,
    required this.onClick,
    this.color,
    this.iconColor,
    required this.bgImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onClick,
          child: Container(
            height: Dimensions.height70,
            width: Dimensions.height70,
            // padding: EdgeInsets.only(
            //     left: Dimensions.height10, right: 10, bottom: 10, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Dimensions.height30,
                  width: Dimensions.height30,
                  // height: 40,
                  // width: 40,
                  child: Center(
                    child: icon != null
                        ? Image.asset(
                            "$icon",
                            // color: Colors.white,
                            // fit: BoxFit.fill,
                            // color: AppColors.deepPurpleColor,
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: color != null ? color : Colors.transparent,
                borderRadius: BorderRadius.circular(Dimensions.width15),
                image: DecorationImage(
                  image: AssetImage(
                    bgImg,
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      offset: Offset(0, 3),
                      spreadRadius: 2,
                      color: Colors.grey.withOpacity(.3)),
                ]),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        RegularText(
          text: title,
          size: Dimensions.font16 - 2,
        ),
        // Container
      ],
    );
  }
}

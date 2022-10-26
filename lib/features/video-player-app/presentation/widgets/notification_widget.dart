import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

import '../Utils/dimenstion.dart';
import '../pages/home/news_details.dart';

class NotificationWidget extends StatefulWidget {
  final int index;
  final bool? edit;
  final IconData? icon;
  final String imgUrl;
  const NotificationWidget({
    Key? key,
    required this.index,
    this.edit,
    this.icon,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  bool _deleteSelected = false;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(NewsDetailPage());
      },
      child: Container(
        margin: EdgeInsets.only(left: Dimensions.width15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Dimensions.width181 - 2,
              height: 108,
              child: Image.network(
                widget.imgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              width: Dimensions.width15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: "Eminem - Rap God"),
                SizedBox(
                  height: Dimensions.width10,
                ),
                RegularText(
                  text: "EminemVevo",
                  size: 12,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                RegularText(
                  text: "Nov 12, 2022",
                  size: 12,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: Dimensions.width15),
              child: widget.edit!
                  ? Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.grey,
                    )
                  : Icon(
                      widget.icon != null
                          ? widget.icon
                          : Icons.arrow_forward_ios,
                      color: AppColors.lightPurple,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

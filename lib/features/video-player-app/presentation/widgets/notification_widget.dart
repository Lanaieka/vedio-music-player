import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

import '../Utils/dimenstion.dart';
import '../pages/home/news_details.dart';

class NotificationWidget extends StatefulWidget {
  final int index;
  final bool? edit;
  final IconData? icon;
  final String imgUrl;
  final Function(int) onClick;
  final Function() onTap;
  const NotificationWidget({
    Key? key,
    required this.index,
    this.edit,
    this.icon,
    required this.imgUrl,
    required this.onClick,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  bool _deleteSelected = false;
  int func() {
    return 0;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onClick(widget.index);
        });
        widget.edit == false ? widget.onTap() : null;
      },
      child: Padding(
        padding: EdgeInsets.all(Dimensions.width10 - 2),
        child: Container(
          margin: EdgeInsets.only(left: Dimensions.width15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: Dimensions.width181 - 2,
                height: Dimensions.height102 + 6,
                child: Image.asset(
                  widget.imgUrl,
                  fit: BoxFit.cover,
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
                        color: AppColors.darkGrey,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

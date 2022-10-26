import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/notification_widget.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _deleteNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            icon: Icons.delete,
            title: "Notification",
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotificationWidget(
                        imgUrl:
                            "https://variety.com/wp-content/uploads/2018/08/eminem.jpg",
                        index: index,
                        edit: false,
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? secondIcon;
  final Color? iconColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
    this.secondIcon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.width10 + Dimensions.height25),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 0.5),
          blurRadius: 5,
        )
      ]),
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.width15,
          right: Dimensions.width15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: Dimensions.height5,
                ),
                RegularText(
                  text: title,
                  color: AppColors.mainColor,
                  size: Dimensions.font20,
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor != null ? iconColor : AppColors.lightPurple,
                ),
                SizedBox(
                  width: Dimensions.height5,
                ),
                secondIcon != null
                    ? Icon(
                        secondIcon,
                        color: iconColor != null
                            ? iconColor
                            : AppColors.lightPurple,
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

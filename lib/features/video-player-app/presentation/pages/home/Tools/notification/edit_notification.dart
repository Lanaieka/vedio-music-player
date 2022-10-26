import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/notification_widget.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

class EditNotificationPage extends StatefulWidget {
  const EditNotificationPage({super.key});

  @override
  State<EditNotificationPage> createState() => _EditNotificationPageState();
}

class _EditNotificationPageState extends State<EditNotificationPage> {
  bool _deleteNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              EditNotificaionBar(
                icon: Icons.delete,
                title: "",
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
                            edit: true,
                            index: index,
                            imgUrl:
                                "https://variety.com/wp-content/uploads/2018/08/eminem.jpg",
                          ),
                        );
                      })))
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.height25, right: Dimensions.height25),
                height: 80,
                width: double.infinity,
                color: AppColors.skyColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText(
                      text: "1 selected",
                      size: Dimensions.font16,
                    ),
                    Container(
                      height: 40,
                      width: 134,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.width15),
                          gradient: new LinearGradient(
                              colors: [
                                AppColors.mainColor,
                                AppColors.redColor,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ],
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                              tileMode: TileMode.repeated)),
                      child: Center(
                        child: BoldText(
                          text: "Detele",
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class EditNotificaionBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? secondIcon;

  const EditNotificaionBar({
    Key? key,
    required this.title,
    required this.icon,
    this.secondIcon,
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
                    Icons.cancel_outlined,
                    color: Colors.grey,
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
                // Icon(
                //   icon,
                //   color: AppColors.lightPurple,
                // ),
                // SizedBox(
                //   width: Dimensions.height5,
                // ),
                // secondIcon != null
                //     ? Icon(
                //         secondIcon,
                //         color: AppColors.lightPurple,
                //       )
                //     : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

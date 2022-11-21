import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';

import '../../../../Utils/colors.dart';
import '../../../../Utils/dimenstion.dart';
import '../../../../widgets/bold_text.dart';
import '../../../../widgets/notification_widget.dart';
import '../../../../widgets/regular_text.dart';

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
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NotificationWidget(
                            onTap: () {},
                            onClick: (input) {
                              setState(() {
                                index = input;
                              });
                            },
                            edit: true,
                            index: index,
                            imgUrl: AppImages.elonMust,
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
                height: Dimensions.height70 + Dimensions.width10,
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
                      height: Dimensions.height45 - 5,
                      width: Dimensions.height140 - 6,
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
                          size: Dimensions.font16 - 2,
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
      height: Dimensions.height102 - 2,
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
                    Icons.cancel_rounded,
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

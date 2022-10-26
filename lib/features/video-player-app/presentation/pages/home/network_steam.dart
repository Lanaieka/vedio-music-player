import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/Tools/notification/Notification_page.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/home_screen.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/latest_news.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimenstion.dart';
import '../../widgets/regular_text.dart';

class NetworkSream extends StatefulWidget {
  const NetworkSream({super.key});

  @override
  State<NetworkSream> createState() => _NetworkSreamState();
}

class _NetworkSreamState extends State<NetworkSream> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleCustomBar(
            title: "Network Stram",
            icon: Icons.arrow_back_ios_new_sharp,
            secondIcon: null,
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.height25, right: Dimensions.height25),
            child: BoldText(
              text: "Neter Network URL",
              size: 16,
            ),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          SearchField(searchController: _searchController),
          SizedBox(
            height: Dimensions.height45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ToolsButton(
                title: "Play",
                icon: Icons.play_arrow,
                color: Colors.white,
                iconColor: AppColors.lightPurple,
                index: 1,
              ),
              ToolsButton(
                title: "Cancel",
                icon: Icons.cancel_outlined,
                color: Colors.white,
                iconColor: AppColors.lightPurple,
                index: 1,
              ),
              ToolsButton(
                title: "Reset",
                icon: Icons.lock_clock,
                color: Colors.white,
                iconColor: AppColors.lightPurple,
                index: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SimpleCustomBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? secondIcon;

  const SimpleCustomBar({
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
                    Icons.arrow_back,
                    color: AppColors.mainColor,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: Dimensions.height5,
                ),
                RegularText(
                  text: title,
                  color: AppColors.mainColor,
                  size: Dimensions.font22,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

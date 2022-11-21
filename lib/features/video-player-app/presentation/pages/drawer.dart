import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/Tools/notification/Notification_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/legal_policies.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/network_steam.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/profile/profile_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/setting/setting_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/photos/all_photos.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/widget_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/theme/theme_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/download_video.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/online_videos/all_videos.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

import '../Utils/dimenstion.dart';

class DrawerBar extends StatelessWidget {
  List<String> _menuTitle = [
    "More Apps",
    "Mp3 Converter",
    "Dark Mode",
    "Widgets",
    "Notification",
    "Me",
    "PlayList",
    "All Videos",
    "Videos Folder",
    "Downloads",
    "Online Videos",
    "Music Libaray",
    "Music Folder",
    "Photo Albumn",
    "All Photo",
    "Filder Manager",
    "Stream",
    "Theme",
    "Legal Policy",
    "Share App",
    "Setting"
  ];
  List<String> _menuIcons = [
    AppIcons.widgetsRed,
    MenuIcons.mp3File,
    MenuIcons.theme,
    MenuIcons.widget,
    MenuIcons.notification,
    MenuIcons.me,
    MenuIcons.playlist,
    MenuIcons.allvidoes,
    MenuIcons.videoFolder,
    MenuIcons.download,
    MenuIcons.onlineVideos,
    MenuIcons.musicFolder,
    MenuIcons.music,
    MenuIcons.photoAlbumn,
    MenuIcons.allvidoes,
    MenuIcons.homeScreen,
    MenuIcons.liveStreaming,
    MenuIcons.theme,
    MenuIcons.legal,
    MenuIcons.share,
    MenuIcons.setting,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // Remove padding
        // padding: EdgeInsets.zero,
        children: [
          Container(
            height: Dimensions.height102 + Dimensions.height25,
            width: double.infinity,
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.width20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.height157,
                    child: Image.asset(AppIcons.munchLogo),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimensions.height30,
                        width: Dimensions.height30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(.4)),
                        child: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RegularText(
                        text: "User",
                        size: 10,
                      ),
                    ],
                  )
                ]),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _menuTitle.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      _menuTitle[index] == "Stream"
                          ? Get.to(NetworkSream())
                          : null;
                      _menuTitle[index] == "Legal Policy"
                          ? Get.to(LegalPliciiesPage())
                          : null;
                      _menuTitle[index] == "Setting"
                          ? Get.to(SettingPage())
                          : null;
                      _menuTitle[index] == "Me" ? Get.to(ProfilePage()) : null;
                      _menuTitle[index] == "Widgets"
                          ? Get.to(SiteWidgetPage())
                          : null;
                      _menuTitle[index] == "Downloads"
                          ? Get.to(DownloadVideoPage())
                          : null;
                      _menuTitle[index] == "Theme"
                          ? Get.to(All_themes())
                          : null;
                      _menuTitle[index] == "Notification"
                          ? Get.to(NotificationPage())
                          : null;
                      // _menuTitle[index] == "All Videos"
                      //     ? Get.to(AllVideosPage())
                      //     : null;
                      _menuTitle[index] == "Online Videos"
                          ? Get.to(AllVideosPage())
                          : null;
                      _menuTitle[index] == "All Photo"
                          ? Get.to(AllPhotosPage())
                          : null;
                    },
                    child: MenuTileWidget(
                      title: _menuTitle[index],
                      icon: _menuIcons[index],
                      isSwitch: _menuTitle[index] == "Dark Mode" ? true : false,
                    ),
                  );
                })),

            //
          )
        ],
      ),
    );
  }
}

class MenuTileWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSwitch;
  const MenuTileWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      height: Dimensions.height65 - 5,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.height30,
              width: Dimensions.height30,
              child: Image.asset(icon),
            ),
            SizedBox(
              width: Dimensions.width20,
            ),
            BoldText(
              text: title,
              size: Dimensions.font16,
              fontWeight: FontWeight.w500,
              color: AppColors.greyPurpleColor,
            ),
          ],
        ),
        isSwitch
            ? Switch(value: false, onChanged: (a) {})
            : Container(
                height: Dimensions.width20,
                width: Dimensions.width20,
              ),
      ]),
    );
  }
}

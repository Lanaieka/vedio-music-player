import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/about_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/help_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/language/laguage_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/setting/setting_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/whatsApp/whatapp_status.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/dimenstion.dart';
import '../../../Utils/icons.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/square_widget.dart';
import '../network_steam.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> _toolsList = ["Download", "Theme", "Privary", "Music"];
  final List<String> _profileList = [
    "Whatsapp",
    "Theme",
    "Languages",
    "Dark Mode",
    "setting",
    "Rate Us",
    "About",
    "Help"
  ];
  final List<String> _foldersList = [
    "Whatsapp video saver",
    "PlayList",
    "Recent Video Added",
    "File Manager"
  ];
  final List<String> _bgImg = [
    AppIcons.rectangleGreen,
    AppIcons.rectangleRed,
    AppIcons.rectangleSky,
    AppIcons.rectangleBlue,
  ];
  final List<String> _iconsList = [
    HomeIcons.downloadWhite,
    HomeIcons.clockWhite,
    HomeIcons.privacyWhite,
    HomeIcons.musicWhite,
  ];
  final List<String> _iconsList2 = [
    HomeIcons.whatsappTile,
    MenuIcons.theme,
    AppIcons.language,
    HomeIcons.profileTheme,
    HomeIcons.profileSetting,
    HomeIcons.profileStar,
    HomeIcons.profileAbout,
    HomeIcons.profileHelp,
  ];
  final List<Color?> _colorsList = [
    Color.fromARGB(255, 1, 221, 255),
    Colors.red,
    Colors.pink,
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleCustomBar(
            title: "Profile",
            icon: Icons.arrow_back_ios_new,
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          Container(
            padding: EdgeInsets.only(left: Dimensions.height25 - 5),
            height: Dimensions.height102 + Dimensions.height25 - 3,
            width: Dimensions.width368 - 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Colors.black, Color.fromARGB(255, 55, 9, 238)]),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: Dimensions.width50,
                        width: Dimensions.width50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColors.lightPurple,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BoldText(
                        text: "Hi, User",
                        color: Colors.white,
                        size: Dimensions.font25,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.width15),
                      child: SizedBox(
                          height: Dimensions.height30,
                          width: Dimensions.height30,
                          child: Image.asset(HomeIcons.edit)),
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          Center(
            child: Container(
              height: Dimensions.height140,
              width: Dimensions.screenWidth,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: Dimensions.height25),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: EdgeInsets.all(10),
                        child: SquareWidget(
                          bgImg: _bgImg[index],
                          onClick: () {},
                          title: _toolsList[index],
                          icon: _iconsList[index],
                          color: _colorsList[index],
                          index: index,
                        ));
                  })),
            ),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          Divider(
            thickness: Dimensions.width10,
          ),
          Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _iconsList2.length,
                  itemBuilder: ((context, index) {
                    return ProfilesListTile(
                        onClick: () {
                          index == 2 ? Get.to(LanguagePage()) : null;
                          index == 4 ? Get.to(SettingPage()) : null;
                          index == 5 ? Get.to(AboutPage()) : null;
                          index == 6 ? Get.to(HelpPage()) : null;
                          index == 0 ? Get.to(WhatsAppStatus()) : null;
                        },
                        title: _profileList[index],
                        icon: _iconsList2[index]);
                  }))),
        ],
      ),
    );
  }
}

class ProfilesListTile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onClick;

  const ProfilesListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.width15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: onClick,
          child: Row(
            children: [
              SizedBox(
                height: Dimensions.height30,
                width: Dimensions.height30,
                child: Image.asset(
                  icon,
                  // color: AppColors.darkGrey,
                ),
              ),
              SizedBox(
                width: Dimensions.width15,
              ),
              BoldText(
                text: title,
                fontWeight: FontWeight.w500,
                size: Dimensions.font16 - 2,
              ),
            ],
          ),
        ),
        title == "Dark Mode"
            ? Switch(value: false, onChanged: (val) {})
            : Container(),
      ]),
    );
  }
}

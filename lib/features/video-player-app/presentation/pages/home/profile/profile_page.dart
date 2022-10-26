import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/network_steam.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';

import '../home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> _toolsList = ["Download", "Download", "Privary", "Music"];
  final List<String> _profileList = [
    "Whatsapp",
    "Theme",
    "Dark Mode",
    "setting"
  ];
  final List<String> _foldersList = [
    "Whatsapp video saver",
    "PlayList",
    "Recent Video Added",
    "File Manager"
  ];
  final List<IconData> _iconsList = [
    Icons.download,
    Icons.punch_clock,
    Icons.lock,
    Icons.music_note
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
            padding: EdgeInsets.only(left: 20),
            height: 121,
            width: 366,
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
                        height: 50,
                        width: 50,
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
                        size: 25,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.width15),
                      child: Icon(
                        Icons.edit_calendar_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          Container(
            height: Dimensions.width181 + Dimensions.height15,
            width: Dimensions.screenWidth,
            padding: EdgeInsets.only(left: Dimensions.height25),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: ToolsButton(
                        title: _toolsList[index],
                        icon: _iconsList[index],
                        color: _colorsList[index],
                        index: index,
                      ));
                })),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          Divider(
            thickness: 10,
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: _iconsList.length,
                  itemBuilder: ((context, index) {
                    return ProfilesListTile(
                        title: _profileList[index], icon: _iconsList[index]);
                  }))),
        ],
      ),
    );
  }
}

class ProfilesListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfilesListTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.width15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.lightPurple,
            ),
            SizedBox(
              width: Dimensions.width15,
            ),
            BoldText(
              text: title,
              size: Dimensions.font16,
            ),
          ],
        ),
        title == "Dark Mode"
            ? Switch(value: false, onChanged: (val) {})
            : Container(),
      ]),
    );
  }
}

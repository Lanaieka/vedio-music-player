import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/Tools/notification/Notification_page.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/latest_news.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/news_tile.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _toolsList = [
    "Themes",
    "Download",
    "Notifications",
    "Privacy"
  ];
  final List<String> _foldersList = [
    "Whatsapp video saver",
    "PlayList",
    "Recent Video Added",
    "File Manager"
  ];
  final List<IconData> _iconsList = [
    Icons.dark_mode,
    Icons.download,
    Icons.notifications_active,
    Icons.privacy_tip_sharp
  ];
  final List<Color?> _colorsList = [
    Color.fromARGB(255, 1, 221, 255),
    Colors.red,
    Colors.pink,
    Colors.orange
  ];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),

          // search bar
          Center(
            child: Container(
              height: 57,
              width: 378,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: 5)
                  ]),
              child: TextFormField(
                controller: _searchController,
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(10),
                  hintText: "Search Videos and news",
                  // label: Text("hellow"),
                  hintStyle: TextStyle(color: Colors.black),

                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search, color: Colors.grey)),

                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // Recent News
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularText(
                  text: "Recent View",
                  size: Dimensions.font16,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LatestNews());
                  },
                  child: RegularText(
                    text: "see more >",
                    size: Dimensions.font16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 175,
            width: Dimensions.screenWidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsTile(),
                  );
                })),
          )
          //Tools
          ,

          SizedBox(
            height: Dimensions.width20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularText(
                  text: "Tools",
                  size: Dimensions.font16,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.width20,
          ),
          Container(
            height: Dimensions.width181 + Dimensions.height15,
            width: Dimensions.screenWidth,
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
          //Folders

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularText(
                  text: "Folders",
                  size: Dimensions.font16,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.height277 + Dimensions.height25,
            width: Dimensions.screenWidth,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: FolderButton(
                      title: _foldersList[index],
                      icon: _iconsList[index],
                      color: _colorsList[index],
                    ),
                  );
                })),
          ),
        ]),
      ),
    );
  }
}

class ToolsButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;

  final Color? color;
  final Color? iconColor;
  const ToolsButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
    required this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        GestureDetector(
          onTap: () {
            index == 2 ? Get.to(NotificationPage()) : null;
          },
          child: Container(
            height: 70,
            width: 70,
            child: Icon(
              icon,
              color: iconColor != null ? AppColors.lightPurple : Colors.white,
              size: Dimensions.font30,
            ),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8.0,
                      offset: Offset(0, 3),
                      spreadRadius: 5,
                      color: Colors.grey.withOpacity(.3)),
                ]),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        RegularText(
          text: title,
          size: 14,
        ),
        // Container
      ],
    ));
  }
}

class FolderButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  const FolderButton({
    Key? key,
    required this.title,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Container(
          height: 70,
          width: 70,
          child: Icon(
            icon,
            color: Colors.white,
            size: Dimensions.font30,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          width: Dimensions.height10,
        ),
        RegularText(
          text: title,
          size: 14,
        )
      ],
    ));
  }
}

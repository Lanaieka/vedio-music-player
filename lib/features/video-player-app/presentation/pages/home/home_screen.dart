import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/drawer.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/Tools/notification/Notification_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/network_steam.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/profile/profile_page.dart';

import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';

import '../../Utils/dimenstion.dart';
import '../../Utils/icons.dart';
import '../../widgets/news_tile.dart';
import '../../widgets/regular_text.dart';
import '../../widgets/square_widget.dart';
import 'latest_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _toolsList = [
    "Themes",
    "Download",
    "Privacy",
    "Notifications"
  ];
  final List<String> _foldersList = [
    "Whatsapp video saver",
    "PlayList",
    "Recent Video Added",
    "File Manager"
  ];
  final List<IconData> _iconsList2 = [
    Icons.whatsapp,
    Icons.playlist_add,
    Icons.document_scanner,
    Icons.folder
  ];
  final List<String> _iconsList = [
    AppIcons.lightMode,
    AppIcons.clock,
    AppIcons.privacy,
    AppIcons.bell,
  ];
  final List<String> _bgImg = [
    AppIcons.rectangleTeal,
    AppIcons.rectangleRed,
    AppIcons.rectangleSky,
    AppIcons.rectangleBlue,
  ];
  final List<String> _foldersBgImg = [
    HomeIcons.whatsappTile,
    HomeIcons.playlistTile,
    HomeIcons.recentTile,
    HomeIcons.filemanager,
  ];
  final List<Color?> _colorsList = [
    Color.fromARGB(255, 1, 221, 255),
    Colors.red,
    Colors.pink,
    Colors.orange
  ];
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: Dimensions.height45 + Dimensions.width20,
          ),

          // search bar
          Center(
            child: Container(
              height: Dimensions.height53 + 4,
              width: Dimensions.width368 + Dimensions.width10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.width10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: 5)
                  ]),
              child: TextFormField(
                controller: _searchController,
                style: TextStyle(
                  fontSize: Dimensions.font16 - 4,
                ),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(10),
                  hintText: "Search Videos and news",
                  // label: Text("hellow"),
                  hintStyle: TextStyle(color: Colors.black),

                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(Dimensions.width20),
                  suffixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.height10,
                          right: Dimensions.height10,
                          top: Dimensions.width15,
                          bottom: Dimensions.height10),
                      child: Icon(Icons.search, color: Colors.grey)),

                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.height10,
                        right: Dimensions.height10,
                        top: Dimensions.width15,
                        bottom: Dimensions.height10),
                    child: GestureDetector(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: Image.asset(HomeIcons.menuBar),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.width20,
          ),

          // Recent News
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
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
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(LatestNews());
                        },
                        child: RegularText(
                          text: "More",
                          size: Dimensions.font16,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.width20,
          ),
          Container(
            height: Dimensions.height172 + 3,
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
          ),

          // * Tools
          // ,

          SizedBox(
            height: Dimensions.width20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
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
            height: Dimensions.width15,
          ),
          Container(
            height: Dimensions.height140,
            width: Dimensions.screenWidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: SquareWidget(
                        bgImg: _bgImg[index],
                        onClick: () {
                          print("print");
                          index == 3 ? Get.to(NotificationPage()) : null;
                          index == 1 ? Get.to(NetworkSream()) : null;
                          index == 0 ? Get.to(ProfilePage()) : null;
                        },
                        title: _toolsList[index],
                        icon: _iconsList[index],
                        // color: _colorsList[index],
                        color: null,
                        index: index,
                      ));
                })),
          ),

          //  * Folders

          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                bottom: Dimensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText(
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
                padding: EdgeInsets.all(0),
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: FolderButton(
                      title: _foldersList[index],
                      icon: _iconsList2[index],
                      color: _colorsList[index],
                      bgImg: _foldersBgImg[index],
                    ),
                  );
                })),
          ),
        ]),
      ),
    );
  }
}

class FolderButton extends StatelessWidget {
  final String title;
  final String bgImg;
  final IconData icon;
  final Color? color;
  const FolderButton({
    Key? key,
    required this.title,
    required this.bgImg,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Dimensions.height45 - 5,
          width: Dimensions.height45 - 5,
          // child: Icon(
          //   icon,
          //   color: Colors.white,
          //   size: Dimensions.font30,
          // ),
          decoration: BoxDecoration(
            // color: color,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: AssetImage(bgImg)),
          ),
        ),
        SizedBox(
          width: Dimensions.height10,
        ),
        RegularText(
          text: title,
          size: Dimensions.font16 - 2,
        )
      ],
    );
  }
}

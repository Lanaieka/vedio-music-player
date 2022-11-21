import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/favorite_videos/favourite_video.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/online_videos/all_videos.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/search_online_video.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/dimenstion.dart';
import '../../../widgets/big_custom_appbar.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/medium_video_tile.dart';
import '../../../widgets/menu_option_widget.dart';
import '../../../widgets/regular_text.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<String> _menuOpetionsList = [
    "For You",
    "All Videos",
    "Film & Animations",
    "Horror"
  ];
  List<String> _moodsTitle = ["Sad", "Chil", "Happy", "Horror"];
  List<String> _singersTitle = ["Eminem", "Honny Singh", "Gippy", "Atif"];

  List<Color> _colorsList = [
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.green,
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Online Videos",
        firstIconTap: () {
          Get.to(SearchOnlineVideo());
        },
        secondIconTap: () {
          Get.to(FavouriteVideoPage());
        },
        firstIcon: Icons.search,
        secondIcon: Icons.favorite_border,
        color: Colors.black.withOpacity(.6),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // CustomAppBar(
          //   title: "Online Videos",
          //   icon: Icons.search,
          //   secondIcon: Icons.favorite_border_sharp,
          //   iconColor: Colors.black.withOpacity(.6),
          // ),
          Column(
            children: [
              SizedBox(
                height: Dimensions.height15,
              ),

              //* Menu section

              Container(
                  height: Dimensions.height30 + 5,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: _menuOpetionsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: MenuOptionsWidget(
                              index: index,
                              title: _menuOpetionsList[index],
                              selectedIndex: selectedIndex,
                            ),
                          ),
                        );
                      }))),
              SizedBox(
                height: Dimensions.height15,
              ),

              //* */ Trending Artitist
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BoldText(
                    text: "Trending Artists",
                    size: Dimensions.font16,
                  ),
                ),
              ),

              Container(
                height: Dimensions.height140,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(AllVideosPage());
                        },
                        child: CircularImageWidget(
                          title: _singersTitle[index],
                          imgUrl: "assets/images/singer.jpeg",
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),

              // * Moods

              Padding(
                padding: EdgeInsets.only(left: Dimensions.width15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BoldText(
                    text: "Moods",
                    size: Dimensions.font16,
                  ),
                ),
              ),
              Container(
                height: Dimensions.height140,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return CircularImageWidget(
                        title: _moodsTitle[index],
                        imgUrl: AppIcons.glass,
                        bgColor: _colorsList[index],
                      );
                    })),
              )

              // * Trending Music Videos
              ,
              SizedBox(
                height: Dimensions.height15,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BoldText(
                    text: "Trending Music Vidoes",
                    size: Dimensions.font16,
                  ),
                ),
              ),
              Container(
                height: Dimensions.height217 - 17,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediumVideoTile(
                          title: "Despacito",
                          subtitle: "Luis Fonsi | feat. Daddy",
                          imgUrl: AppImages.elonMust,
                        ),
                      );
                    })),
              ),

              // * Motivational Vidoes

              Padding(
                padding: EdgeInsets.only(left: Dimensions.width15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BoldText(
                    text: "Motivational Vidoes",
                    size: Dimensions.font16,
                  ),
                ),
              ),
              Container(
                height: Dimensions.height217 - 17,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediumVideoTile(
                          title: "I WILL NEVER QUIT",
                          subtitle: "There is a limit, sky!",
                          imgUrl: AppImages.elonMust,
                        ),
                      );
                    })),
              ),

              // * Science and Technology

              Padding(
                padding: EdgeInsets.only(left: Dimensions.width15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BoldText(
                    text: "Science & Technology",
                    size: Dimensions.font16,
                  ),
                ),
              ),
              Container(
                height: Dimensions.height217 - 17,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediumVideoTile(
                          title: "Science Tips and Tricks",
                          subtitle: "5 Mints - Crafts",
                          imgUrl: AppImages.elonMust,
                        ),
                      );
                    })),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class CircularImageWidget extends StatelessWidget {
  final String title;
  final String imgUrl;
  final Color? bgColor;

  const CircularImageWidget({
    Key? key,
    required this.title,
    required this.imgUrl,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: Dimensions.height102 - 2,
            width: Dimensions.height102 - 2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor != null ? bgColor : Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                ),
                border: Border.all(
                  color: bgColor != null ? Colors.transparent : Colors.black,
                )),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          RegularText(
            text: title,
            size: Dimensions.height10 + 2,
          ),
        ],
      ),
    );
  }
}

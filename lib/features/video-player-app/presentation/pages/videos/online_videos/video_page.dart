import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/Tools/notification/Notification_page.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/medium_video_tile.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

import '../../../widgets/big_custom_appbar.dart';

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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Online Videos",
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
                  height: 34,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: _menuOpetionsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
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
                height: 140,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return CircularImageWidget(
                        title: "Eminem",
                        imgUrl: "assets/images/singer.jpeg",
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
                height: 140,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return CircularImageWidget(
                        title: "Sad",
                        imgUrl: "assets/images/sad.png",
                        bgColor: AppColors.redColor,
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
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediumVideoTile(
                          title: "Despacito",
                          subtitle: "Luis Fonsi | feat. Daddy",
                          imgUrl:
                              "https://imageio.forbes.com/blogs-images/hughmcintyre/files/2017/08/Despacito-video-1200x794.jpg?format=jpg&width=960",
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
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediumVideoTile(
                          title: "I WILL NEVER QUIT",
                          subtitle: "There is a limit, sky!",
                          imgUrl:
                              "http://www.papertyari.com/wp-content/uploads/2019/02/motivation-1024x568.jpg",
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
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediumVideoTile(
                          title: "Science Tips and Tricks",
                          subtitle: "5 Mints - Crafts",
                          imgUrl:
                              "https://i.ytimg.com/vi/rrUIXt-y730/maxresdefault.jpg",
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
            height: 100,
            width: 100,
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

class MenuOptionsWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final int index;
  final int selectedIndex;
  const MenuOptionsWidget({
    Key? key,
    required this.title,
    this.color,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 10),
      decoration: BoxDecoration(
        color: selectedIndex == index ? AppColors.darkBlueColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: selectedIndex == index ? Colors.transparent : Colors.grey),
      ),
      child: RegularText(
        text: title,
        size: Dimensions.font16 - 2,
        color: selectedIndex == index ? Colors.white : Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/latest_news.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/widgets/browser_history_widget.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/square_widget.dart';

import '../../widgets/circular_widget.dart';

class SiteHomePage extends StatefulWidget {
  const SiteHomePage({super.key});

  @override
  State<SiteHomePage> createState() => _SiteHomePageState();
}

class _SiteHomePageState extends State<SiteHomePage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        firstIcon: Icons.safety_check,
        secondIcon: Icons.safety_check,
        title: "Munch Time",
        color: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height25,
            ),

            // * Widgets row

            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.height25 + Dimensions.height25,
                  right: Dimensions.height25 + Dimensions.height25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SquareWidget(
                      onClick: () {},
                      bgImg: AppIcons.rectangleTeal,
                      title: "Widget",
                      icon: AppIcons.widgetsWhite,
                      // iconColor: Colors.white,
                      index: 0,
                      color: Colors.tealAccent),
                  SquareWidget(
                      onClick: () {},
                      bgImg: AppIcons.rectangleRed,
                      title: "Download",
                      icon: HomeIcons.downloadWhite,
                      index: 0,
                      color: Colors.red),
                  SquareWidget(
                      onClick: () {},
                      bgImg: AppIcons.rectangleSky,
                      title: "Privacy",
                      icon: AppIcons.privacy,
                      index: 0,
                      color: Colors.purple),
                  SquareWidget(
                    onClick: () {},
                    bgImg: AppIcons.rectangleBlue,
                    title: "Save",
                    icon: AppIcons.save,
                    index: 0,
                    color: Colors.pink,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: Dimensions.height25,
            ),

            SearchField(searchController: _searchController),

            // * recommended sites
            SizedBox(
              height: Dimensions.height25,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: BoldText(
                  text: "Recommended Sites",
                  size: Dimensions.font20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.font16 - 1,
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularIconWidget(
                    title: "Youtube",
                    icon: AppIcons.youtube,
                    bgColor: AppColors.redColor,
                  ),
                  CircularIconWidget(
                    title: "Instaram",
                    icon: AppIcons.instagram,
                    bgColor: AppColors.blueColor,
                  ),
                  CircularIconWidget(
                    title: "Facebook",
                    icon: AppIcons.facebook,
                    bgColor: Colors.green,
                  ),
                  CircularIconWidget(
                    title: "Whatsapp",
                    icon: AppIcons.whatsapp,
                    bgColor: AppColors.blueColor,
                  ),
                  SizedBox(
                      // width: Dimensions.w,
                      ),
                ],
              ),
            ),

            // * row 2

            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularIconWidget(
                    title: "Twitter",
                    icon: AppIcons.twitter,
                    bgColor: AppColors.redColor,
                  ),
                  CircularIconWidget(
                    title: "Vimeo",
                    icon: AppIcons.vimeo,
                    bgColor: AppColors.blueColor,
                  ),
                  CircularIconWidget(
                    title: "Twitch",
                    icon: AppIcons.twitch,
                    bgColor: Colors.green,
                  ),
                  CircularIconWidget(
                    title: "Widgets",
                    icon: HomeIcons.moreWidget,
                    bgColor: AppColors.blueColor,
                  ),
                  SizedBox(
                      // width: Dimensions.w,
                      ),
                ],
              ),
            ),

            SizedBox(
              height: Dimensions.height25,
            ),

            // * Youtube play button
            Container(
              height: Dimensions.height70 + 3,
              width: Dimensions.width368 - 9,
              decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(10)),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  AppIcons.youtube,
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
                BoldText(
                  text: "Download Youtube Videos now!",
                  color: Colors.white,
                  size: Dimensions.font16,
                ),
              ]),
            )

            // * bookmarks

            ,
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: BoldText(
                  text: "Bookmark Platform",
                  size: Dimensions.width20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimensions.width20,
                ),
                SquareWidget(
                  onClick: () {},
                  //
                  title: "Facebook",
                  bgImg: SiteIcons.facebookTile,
                  // icon: AppIcons.facebook,
                  index: 0,
                  // color: Colors.red,
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
                SquareWidget(
                  onClick: () {},
                  bgImg: SiteIcons.googleTIle,
                  title: "Google",
                  // icon: AppIcons.google,
                  index: 0,
                  // color: Colors.purple,
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
                SquareWidget(
                  onClick: () {},
                  title: "Add",
                  bgImg: SiteIcons.moreTile,
                  // icon: AppIcons.add,
                  index: 0,
                  // color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            // * History

            BrowserHistoryWidget(),
            BrowserHistoryWidget(),
            SizedBox(
              height: Dimensions.height25,
            ),
          ],
        ),
      ),
    );
  }
}

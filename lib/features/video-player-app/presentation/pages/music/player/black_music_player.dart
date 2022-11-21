import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class BlackMusicPlayer extends StatefulWidget {
  const BlackMusicPlayer({super.key});

  @override
  State<BlackMusicPlayer> createState() => _BlackMusicPlayerState();
}

class _BlackMusicPlayerState extends State<BlackMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: Dimensions.width20),
            height: Dimensions.height25,
            width: Dimensions.height25,
            child: Image.asset(
              AppIcons.share,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        decoration: BoxDecoration(color: Colors.black
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     stops: [
            //       0.2,
            //       0.2,
            //       0.5,
            //       0.8,
            //       0.6,
            //     ],
            //     colors: [
            //       Colors.black,
            //       Colors.black,
            //       Colors.purple.withOpacity(1),
            //       Colors.black,
            //       Colors.black,
            //     ]),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height102,
            ),
            Container(
              height: Dimensions.height383 - Dimensions.height30,
              width: Dimensions.height383 - Dimensions.height30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage(AppImages.singer2),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            RegularText(
              text: "Sapa",
              color: Colors.white,
              size: 12,
            ),
            BigBoldText(
              text: "You go See Shege",
              color: Colors.white,
              size: Dimensions.font25 - 1,
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            // * Controller Row

            Padding(
              padding: EdgeInsets.only(left: 70, right: 70, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      AppIcons.repeat,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height53 - 3,
                    width: Dimensions.height53 - 3,
                    child: Image.asset(
                      AppIcons.chevronsLeft,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF9B0404),
                    ),
                    height: Dimensions.height70 + 10,
                    width: Dimensions.height70 + 10,
                    child: Center(child: Image.asset(AppIcons.playRounded)),
                  ),
                  SizedBox(
                    height: Dimensions.height53 - 3,
                    width: Dimensions.height53 - 3,
                    child: Image.asset(
                      AppIcons.chevronsReft,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height25,
                    width: Dimensions.height25,
                    child: Image.asset(
                      AppIcons.shuffle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
// * Progress Bar
            SizedBox(
              width: Dimensions.height383 -
                  Dimensions.height70 -
                  Dimensions.height10 +
                  3,
              child: ProgressBar(
                thumbColor: Colors.white,
                bufferedBarColor: Colors.grey.withOpacity(.4),
                progressBarColor: Color(0xFF9B0404),
                baseBarColor: Colors.white,
                progress: Duration(milliseconds: 2000),
                buffered: Duration(milliseconds: 3000),
                total: Duration(milliseconds: 5000),
                thumbGlowColor: Colors.white,
                timeLabelTextStyle: TextStyle(color: Colors.white),
                onSeek: (duration) {
                  print('User selected a new time: $duration');
                },
              ),
            ),

            // * comming up next
          ],
        ),
      ),
    );
  }
}

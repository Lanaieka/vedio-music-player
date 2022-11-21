import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class TealMusicPlayer extends StatefulWidget {
  const TealMusicPlayer({super.key});

  @override
  State<TealMusicPlayer> createState() => _TealMusicPlayerState();
}

class _TealMusicPlayerState extends State<TealMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.white,
        ),
        title: BoldText(
          text: "Now Player",
          size: 20,
          color: Colors.white,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 25,
            width: 25,
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
        decoration: BoxDecoration(
          color: Colors.black,
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          // stops: [
          //   0.4,
          //   0.5,
          //   0.7,
          // ],
          // colors: [
          //   Color.fromARGB(255, 255, 96, 64),
          //   Colors.black,
          //   Color.fromARGB(255, 15, 88, 124)
          // ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height102 + 30,
            ),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                // shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(AppImages.tealMusic), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: Dimensions.height53,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigBoldText(
                    text: "ARE YOU READY?",
                    color: Colors.white,
                    size: Dimensions.font25 - 1,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: RegularText(
                  text: "Moeskin",
                  color: Colors.grey,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),

            // * Progress Bar
            SizedBox(
              width: 300,
              child: ProgressBar(
                thumbColor: Colors.white,
                bufferedBarColor: Colors.grey.withOpacity(.2),
                progressBarColor: Color(0xFF2B97BD),
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
                      AppIcons.skipPrevious,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2B97BD),
                            Color.fromARGB(255, 130, 211, 240),
                          ]),
                    ),
                    height: 80,
                    width: 80,
                    child: Icon(
                      Icons.pause,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      AppIcons.skipNext,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // * ROw

            SizedBox(
              height: Dimensions.height25,
            ),

            Padding(
              padding: EdgeInsets.only(left: 150, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.repeat,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      Icon(
                        Icons.shuffle,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

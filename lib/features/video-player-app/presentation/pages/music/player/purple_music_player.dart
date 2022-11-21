import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class PurpleMusicPlayer extends StatefulWidget {
  const PurpleMusicPlayer({super.key});

  @override
  State<PurpleMusicPlayer> createState() => _PurpleMusicPlayerState();
}

class _PurpleMusicPlayerState extends State<PurpleMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_new_sharp,
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
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.2,
                0.2,
                0.5,
                0.8,
                0.6,
              ],
              colors: [
                Colors.black,
                Colors.black,
                Colors.purple.withOpacity(1),
                Colors.black,
                Colors.black,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height102,
            ),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage(AppImages.singer2),
                ),
              ),
            ),
            BigBoldText(
              text: "Edhir Neechal Adi",
              color: Colors.white,
              size: Dimensions.font25 - 1,
            ),
            RegularText(
              text: "Anirudh Musical Edirneechai",
              color: Colors.grey,
              size: 12,
            ),
            SizedBox(
              height: Dimensions.height25,
            ),

            // * Progress Bar
            SizedBox(
              width: 300,
              child: ProgressBar(
                thumbColor: Colors.white,
                bufferedBarColor: Colors.grey.withOpacity(.4),
                progressBarColor: Colors.white,
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
                      AppIcons.shuffle,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      AppIcons.playNext,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 80,
                    width: 80,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      AppIcons.playNext,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      AppIcons.repeat,
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // * comming up next

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: BoldText(
                  text: "Coming Up next",
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              width: 364,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Colors.grey.withOpacity(.4),
                    Colors.grey.withOpacity(.2),
                  ])),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(AppImages.singer2),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              BoldText(
                                text: "Un Ki Zindagi",
                                size: 12,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              RegularText(
                                text: "G.V Prakash",
                                size: 12,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

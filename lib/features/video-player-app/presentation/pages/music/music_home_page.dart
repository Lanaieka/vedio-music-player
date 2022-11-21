import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/tabs/album_tab.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/tabs/artist_tab.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/tabs/playlist_tab.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/tabs/songs_tab.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  final List<String> cataList = [
    "Songs",
    "PlayList",
    "Artist",
    "Albums",
    "Genre",
    "Folcs",
    "Catagory",
    "Old",
    "Classic",
  ];

  final List<Widget> tabsList = [
    SongsTab(),
    PlayListTab(),
    ArtistsTab(),
    AlbumTab(),
    SongsTab(),
    PlayListTab(),
    SongsTab(),
    PlayListTab(),
    PlayListTab(),
  ];

  int selectedIndex = 0;
  final OnAudioQuery _onAudioQuery = OnAudioQuery();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // requestStoragePermission();
  }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _onAudioQuery.permissionsRequest();
      if (!permissionStatus) {
        await _onAudioQuery.permissionsRequest();
      }
      // ensure build method
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Dimensions.height10 - 2),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                height: Dimensions.height70,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 5)
                ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.menu,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.height15,
                          ),
                          RegularText(
                            text: "Music",
                            color: AppColors.mainColor,
                            size: Dimensions.font20,
                          )
                        ],
                      ),
                      Icon(Icons.search),
                    ]),
              ),
            ),
            SizedBox(
              height: Dimensions.width15,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RegularText(
                  text: "Recently Played",
                  color: Colors.black,
                  size: Dimensions.font20,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),

            // * songs square widget
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MusicSquareWigdet(),
                  MusicSquareWigdet(),
                  MusicSquareWigdet(),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),

            // * items list
            Container(
              height: Dimensions.height53 - 3,
              width: double.infinity,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cataList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: RegularText(
                              text: cataList[index],
                              size: Dimensions.font16,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          selectedIndex == index
                              ? AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  height: 2,
                                  width: Dimensions.height45 - 5,
                                  color: AppColors.redPurpleColor,
                                )
                              : Container()
                        ],
                      ),
                    );
                  })),
            ),

            Container(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.width15, right: Dimensions.width15),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .54,
                    width: double.infinity,
                    child: tabsList[selectedIndex],
                  ),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

class MusicSquareWigdet extends StatelessWidget {
  const MusicSquareWigdet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.height102 - 2,
          width: Dimensions.height102 + 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(AppImages.singer1))),
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        BigBoldText(
          text: "Enna Vilai",
          size: Dimensions.height10 + 4,
        ),
        RegularText(
          text: "AR Rehman",
          size: Dimensions.height10 + 2,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/player/black_music_player.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/player/orange_music_player.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/tabs/songs_tab.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/widgets/songs_row_widget.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';
import 'package:video_player_app/features/video-player-app/provider/playlist_provider.dart';

class AlbumDetailScreen extends StatefulWidget {
  const AlbumDetailScreen({super.key});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        firstIcon: Icons.abc,
        title: "Album",
        secondIcon: Icons.abc,
        color: Colors.transparent,
      ),
      body: Column(
        children: [
          // * Album Name
          SizedBox(
            height: Dimensions.height25,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height217 - 17,
                  width: Dimensions.height217 - 17,
                  child: Image.asset(AppImages.artist2),
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                BoldText(
                  text: "Tere Naam",
                  size: Dimensions.font16,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                RegularText(
                  text: "10 Songs",
                  size: Dimensions.font16 - 3,
                ),
              ],
            ),
          )
          // * Play all and shuffle

          ,
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.height102 - Dimensions.height10 + 2,
                right: Dimensions.height102 - Dimensions.height10 + 2,
                top: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Dimensions.height30 + 3,
                  width: Dimensions.height102 + 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.width15),
                      border: Border.all(color: Colors.red)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Get.to(OrangeMusicPlayer());
                      },
                      child: BoldText(
                        text: "Play All",
                        size: Dimensions.font16,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Dimensions.height30 + 3,
                  width: Dimensions.height102 + 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.width15),
                      border: Border.all(color: Colors.red)),
                  child: Center(
                    child: BoldText(
                      text: "Shuffle",
                      size: Dimensions.font16,
                    ),
                  ),
                )
              ],
            ),
          ),
          // * List of songs in the album

          Expanded(child:
              Consumer<PlayListprovider>(builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.songs.length,
                itemBuilder: ((context, index) {
                  print("songs : ${value.songs.first}");
                  return Container();
                  // SongsRowWidget(
                  //     songName: value.songs[0],
                  //     subtitle: "subtitle",
                  //     img: QueryArtworkWidget(
                  //       id: 43434,
                  //       type: ArtworkType.ARTIST,
                  //     ));
                }));
          }))
        ],
      ),
    );
  }
}

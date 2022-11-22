import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/album_screen.dart';

import '../../../../provider/playlist_provider.dart';
import '../../../Utils/dimenstion.dart';
import '../../../Utils/images.dart';
import '../../../widgets/big_bold_text.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/regular_text.dart';
import '../widgets/artist_widget.dart';

class AlbumTab extends StatefulWidget {
  AlbumTab({
    Key? key,
  }) : super(key: key);

  @override
  State<AlbumTab> createState() => _AlbumTabState();
}

class _AlbumTabState extends State<AlbumTab> {
  final List<Color> color = [Colors.black, AppColors.redColor, Colors.pink];

  final List<String> icons = [AppIcons.browser, AppIcons.clock, AppIcons.star];

  final List<String> titles = [
    "Craete playlist",
    "Recent Track",
    "My top List"
  ];

  @override
  Widget build(BuildContext context) {
    bool noAlbumn = true;
    return Container(
        child: Row(
      children: [
        // noAlbumn == true
        //     ? Center(
        //         child: Padding(
        //         padding: EdgeInsets.all(Dimensions.height140),
        //         child: RegularText(text: "No Album"),
        //       ))
        //     : Container(),
        Expanded(
          child: Consumer<PlayListprovider>(builder: ((context, value, child) {
            // if (value.playListSongs.length >= 1) {
            //   setState(() {
            //     noAlbumn = true;
            //   });
            // } else {
            //   noAlbumn = false;
            // }
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.playListSongs.length,
                itemBuilder: ((context, index) {
                  print("songs : ${value.songs.first}");
                  return ArtistsSquareWigdet(
                    bgImg: AppImages.artist2,
                    countSongs: value.playListSongs.length,
                    name: value.playListSongs[index].playName,
                  );
                }));
          })),
        ),
      ],
    ));
  }
}

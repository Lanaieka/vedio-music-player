import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';

import '../../../Utils/dimenstion.dart';
import '../../../Utils/images.dart';
import '../../../widgets/big_bold_text.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/regular_text.dart';
import '../widgets/artist_widget.dart';

class ArtistsTab extends StatelessWidget {
  ArtistsTab({
    Key? key,
  }) : super(key: key);

  final List<Color> color = [Colors.black, AppColors.redColor, Colors.pink];
  final List<String> icons = [AppIcons.browser, AppIcons.clock, AppIcons.star];
  final List<String> titles = [
    "Craete playlist",
    "Recent Track",
    "My top List"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        ArtistsSquareWigdet(
          bgImg: AppImages.artists,
          countSongs: 10,
          name: "New",
        ),
        ArtistsSquareWigdet(
          bgImg: AppImages.artist2,
          countSongs: 10,
          name: "New",
        ),
      ],
    ));
  }
}

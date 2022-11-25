import 'package:flutter/material.dart';

import '../../../Utils/dimenstion.dart';
import '../../../Utils/icons.dart';
import '../../../widgets/big_bold_text.dart';
import '../../../widgets/regular_text.dart';

class ArtistsSquareWigdet extends StatelessWidget {
  final String bgImg;
  final String name;
  final int countSongs;

  const ArtistsSquareWigdet({
    Key? key,
    required this.bgImg,
    required this.name,
    required this.countSongs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width15, right: Dimensions.width15),
          height: Dimensions.height102,
          width: Dimensions.height102,
          padding: EdgeInsets.all(Dimensions.height25),
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              // color: Colors.black,
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(bgImg))),
          child: Container(
              child: Image.asset(
            MusicIcons.artistMusic,
            // color: Colors.white,
          )),
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        BigBoldText(
          text: name,
          size: 12,
        ),
        RegularText(
          text: " ${countSongs.toString()} songs",
          size: 10,
        ),
      ],
    );
  }
}

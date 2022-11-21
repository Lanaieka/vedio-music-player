import 'package:flutter/material.dart';

import '../../../Utils/dimenstion.dart';
import '../../../Utils/icons.dart';
import '../../../Utils/images.dart';
import '../../../widgets/big_bold_text.dart';
import '../../../widgets/regular_text.dart';

class ArtistsSquareWigdet extends StatelessWidget {
  final String bgImg;

  const ArtistsSquareWigdet({
    Key? key,
    required this.bgImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 102,
          width: 102,
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
          text: "Enna Vilai",
          size: 12,
        ),
        RegularText(
          text: "10 Songs",
          size: 10,
        ),
      ],
    );
  }
}

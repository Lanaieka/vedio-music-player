import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Dimensions.height102 + 10,
          width: Dimensions.width181 + 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.elonMust,
                  ),
                  fit: BoxFit.fill)),
        ),
        BoldText(
          text: " @ Elon musk says",
          size: Dimensions.font16,
        ),
        // SizedBox(
        //   height: Dimensions.height5,
        // ),
        RegularText(
          text: "Zee News",
          size: Dimensions.font16 - 2,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

class MediumVideoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;

  const MediumVideoTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 113,
            width: 187,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height5),
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(
                      imgUrl,
                    ),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          BoldText(
            text: title,
            size: 16,
          ),
          RegularText(
            text: subtitle,
            size: Dimensions.font16 - 2,
          ),
        ],
      ),
    );
  }
}

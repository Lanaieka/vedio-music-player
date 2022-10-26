import 'package:flutter/material.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
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
                // borderRadius: BorderRadius.circular(10),
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://image.cnbcfm.com/api/v1/image/107083077-1656593419933-gettyimages-1395062617-t_w16437_4934a878-972d-4bea-b6ef-b61f4ceeb787.jpeg?v=1665592117&w=929&h=523",
                    ),
                    fit: BoxFit.fill)),
          ),
          BoldText(
            text: "Elon musk says",
            size: 16,
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          RegularText(
            text: "Zee News",
            size: Dimensions.font16 - 2,
          ),
        ],
      ),
    );
  }
}

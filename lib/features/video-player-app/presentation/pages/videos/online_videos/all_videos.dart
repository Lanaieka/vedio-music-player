import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/notification_widget.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

import '../../../widgets/big_bold_text.dart';
import '../../../widgets/big_custom_appbar.dart';

class AllVideosPage extends StatefulWidget {
  const AllVideosPage({super.key});

  @override
  State<AllVideosPage> createState() => _AllVideosPageState();
}

class _AllVideosPageState extends State<AllVideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Online Videos",
        firstIcon: Icons.search,
        secondIcon: Icons.favorite_border,
        color: Colors.black.withOpacity(.6),
      ),
      body: Column(children: [
        // * background image
        Container(
          height: Dimensions.height172 + Dimensions.width15 + 5,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.billboard.com/wp-content/uploads/2022/09/eminem-vmas-performance-2022-billboard-1548.jpg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width15, bottom: Dimensions.height10),
            child: Column(
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: BigBoldText(
                    text: "Eminem",
                    color: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RegularText(
                    text: "30 videoes",
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
        )

        // * Playlist
        ,
        SizedBox(
          height: Dimensions.height15,
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.width15 + 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: BoldText(
              text: "Playlist",
              size: Dimensions.font16,
            ),
          ),
        ),

        Flexible(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationWidget(
                      edit: false,
                      index: index,
                      icon: Icons.more_vert,
                      imgUrl:
                          "https://variety.com/wp-content/uploads/2018/08/eminem.jpg",
                    ),
                  );
                })))
      ]),
    );
  }
}

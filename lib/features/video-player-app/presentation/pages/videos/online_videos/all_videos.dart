import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/online_videos/video_player.dart';

import '../../../Utils/dimenstion.dart';
import '../../../widgets/big_bold_text.dart';
import '../../../widgets/big_custom_appbar.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/notification_widget.dart';
import '../../../widgets/regular_text.dart';

class AllVideosPage extends StatefulWidget {
  const AllVideosPage({super.key});

  @override
  State<AllVideosPage> createState() => _AllVideosPageState();
}

class _AllVideosPageState extends State<AllVideosPage> {
  List<VideoModel> _videosList = [
    VideoModel(
      title: "Eminem - Rap Star",
      subtitle: "EminemVevo",
      imgUrl: AppImages.elonMust,
    ),
    VideoModel(
      title: "Eminem - Rap Non-stop",
      subtitle: "EminemVevo",
      imgUrl: AppImages.elonMust,
    ),
    VideoModel(
      title: "Eminem - Never Give Up",
      subtitle: "EminemVevo",
      imgUrl: AppImages.elonMust,
    ),
    VideoModel(
      title: "Eminem - Roll out",
      subtitle: "EminemVevo",
      imgUrl: AppImages.elonMust,
    ),
    VideoModel(
      title: "Eminem - Rap Never Dies",
      subtitle: "EminemVevo",
      imgUrl: AppImages.elonMust,
    ),
    VideoModel(
      title: "Eminem - Stop",
      subtitle: "EminemVevo",
      imgUrl: AppImages.elonMust,
    ),
  ];
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
                image: AssetImage(AppImages.elonMust), fit: BoxFit.cover),
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
                itemCount: _videosList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationWidget(
                      onTap: () {
                        Get.to(VideoPlayerPage());
                      },
                      onClick: (a) {},
                      edit: false,
                      index: index,
                      icon: Icons.more_vert,
                      imgUrl: _videosList[index].imgUrl,
                    ),
                  );
                })))
      ]),
    );
  }
}

class VideoModel {
  final String title;
  final String subtitle;
  final String imgUrl;

  VideoModel(
      {required this.title, required this.subtitle, required this.imgUrl});
}

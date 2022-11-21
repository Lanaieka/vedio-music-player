import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';

import '../../../Utils/dimenstion.dart';
import '../../../widgets/big_custom_appbar.dart';
import '../../../widgets/notification_widget.dart';

class FavouriteVideoPage extends StatefulWidget {
  const FavouriteVideoPage({super.key});

  @override
  State<FavouriteVideoPage> createState() => _FavouriteVideoPageState();
}

class _FavouriteVideoPageState extends State<FavouriteVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Favourite Vidoes",
        color: Colors.transparent,
        firstIcon: Icons.abc,
        secondIcon: Icons.abc,
      ),
      body: Column(children: [
        SizedBox(
          height: Dimensions.height10,
        ),
        Flexible(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationWidget(
                      onTap: () {},
                      onClick: (input) {},
                      edit: false,
                      index: index,
                      icon: Icons.more_vert,
                      imgUrl: AppImages.elonMust,
                    ),
                  );
                })))
      ]),
    );
  }
}

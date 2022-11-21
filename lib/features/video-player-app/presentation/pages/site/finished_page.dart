import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Finished",
        firstIcon: Icons.abc,
        secondIcon: Icons.abc,
        color: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(SiteIcons.emtpyPic),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          RegularText(
            text: "No videos found in the progress Queue",
            color: Colors.black,
            size: Dimensions.font16 - 4,
          ),
        ],
      ),
    );
  }
}

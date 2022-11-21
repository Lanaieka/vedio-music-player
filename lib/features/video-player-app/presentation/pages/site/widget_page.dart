import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/custom_button.dart';

class SiteWidgetPage extends StatefulWidget {
  const SiteWidgetPage({super.key});

  @override
  State<SiteWidgetPage> createState() => _SiteWidgetPageState();
}

class _SiteWidgetPageState extends State<SiteWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Widgets",
        firstIcon: Icons.abc,
        secondIcon: Icons.abc,
        color: Colors.transparent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Dimensions.height25,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 344,
              width: 379,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(SiteIcons.mobilePic))),
              child: SizedBox(
                height: 276,
                width: 270,
                // child: Image.asset(
                //   AppIcons.samsung,
                // ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          CustomButton(
              title: "Add to Home Screen",
              color: AppColors.deepPurpleColor,
              onClick: () {}),
        ],
      ),
    );
  }
}

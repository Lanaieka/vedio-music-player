import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class SiteBrowserPage extends StatefulWidget {
  const SiteBrowserPage({super.key});

  @override
  State<SiteBrowserPage> createState() => _SiteBrowserPageState();
}

class _SiteBrowserPageState extends State<SiteBrowserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: Dimensions.height53,
            decoration:
                BoxDecoration(color: AppColors.lightPurple.withOpacity(.2)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Dimensions.width15,
                    width: Dimensions.width15,
                    child: Image.asset(
                      AppIcons.cancelInline,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 + 2,
                    width: Dimensions.height229 + 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.width20),
                      border: Border.all(color: AppColors.redColor),
                    ),
                    child: Center(
                      child: RegularText(
                        text: "https://wwww.google.com/watch",
                        size: Dimensions.width15 - 2,
                        color: AppColors.greyPurpleColor,
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height25,
                    width: Dimensions.height25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: RegularText(
                        text: "4",
                        size: Dimensions.font16 - 4,
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height25,
                    width: Dimensions.height25,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Image.asset(
                        AppIcons.download,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';

import '../../widgets/menu_option_widget.dart';
import '../../widgets/regular_text.dart';

class DownloadVideoPage extends StatefulWidget {
  const DownloadVideoPage({super.key});

  @override
  State<DownloadVideoPage> createState() => _DownloadVideoPageState();
}

class _DownloadVideoPageState extends State<DownloadVideoPage> {
  List<String> _menuOpetionsList = [
    "For You",
    "All Videos",
    "Film & Animations",
    "Horror"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Downlaods",
        firstIcon: Icons.search,
        secondIcon: Icons.more_vert,
        color: Colors.black,
      ),
      body: Column(children: [
        SizedBox(
          height: Dimensions.width15 + 5,
        ),
        Container(
            height: Dimensions.height30 + 6,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _menuOpetionsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: MenuOptionsWidget(
                        index: index,
                        title: _menuOpetionsList[index],
                        selectedIndex: selectedIndex,
                      ),
                    ),
                  );
                }))),
        SizedBox(
          height: Dimensions.height15,
        ),
        Divider(thickness: 2),
        Padding(
          padding: EdgeInsets.all(Dimensions.height30),
          child: Image.asset(
            SiteIcons.emtpyPic,
          ),
        ),
        SizedBox(
          height: Dimensions.height25,
        ),
        RegularText(
          text: "No videos found in the progress Queue",
          color: Colors.black,
          size: Dimensions.font16 - 4,
        ),
      ]),
    );
  }
}

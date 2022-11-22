import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';

import '../../../Utils/dimenstion.dart';
import '../../../Utils/images.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/regular_text.dart';
import '../widgets/bottom_sheet.dart';

class PlayListTab extends StatelessWidget {
  PlayListTab({
    Key? key,
  }) : super(key: key);

  final List<Color> color = [Colors.black, AppColors.redColor, Colors.pink];
  final List<String> icons = [
    MusicIcons.createPlay,
    MusicIcons.recentTrack,
    MusicIcons.top
  ];
  final List<String> titles = [
    "Craete playlist",
    "Recent Track",
    "My top List"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: color.length,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: Dimensions.height65 + 3,
                          height: 62,
                          // padding: EdgeInsets.all(15),
                          child: Image.asset(
                            icons[index],
                            // color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: color[index],
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  index == 0
                                      ? showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(50))),
                                          context: context,
                                          builder: ((context) =>
                                              CreateNewPlayListBottomSheet()))
                                      : null;
                                },
                                child: RegularText(
                                  text: titles[index],
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_option_key,
                      color: Colors.transparent,
                    ),
                  ]),
            );
          })),
    );
  }
}

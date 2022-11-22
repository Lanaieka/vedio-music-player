import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/features/video-player-app/model/playlist_model.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';
import 'package:video_player_app/features/video-player-app/provider/playlist_provider.dart';

import '../../../Utils/dimenstion.dart';

class AlbumBottomSheet extends StatelessWidget {
  AlbumBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildSheet();
  }

  List<String> iconsList = [
    AppIcons.playUnrounded,
    AppIcons.playNext,
    AppIcons.playlist,
    AppIcons.privacy,
    AppIcons.share,
    AppIcons.ringtone,
    AppIcons.delete,
    AppIcons.info,
  ];
  List<String> _namesList = [
    "Play",
    "Next",
    "Add to playlist",
    "Next",
    "Share",
    "Add to  queue",
    "Set as a Ringtone",
    "Delete",
    "Info"
  ];

  Widget buildSheet({String? route}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: BoldText(
              text: "Lagan Lagi",
              size: 16,
            ),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: iconsList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("pressed");
                        index == 2
                            ? showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(50))),
                                context: context,
                                builder: ((context) =>
                                    AddToPlayListBottomSheet()))
                            : null;
                      },
                      child: RowWidget(
                        title: _namesList[index],
                        icon: iconsList[index],
                      ),
                    );
                  })))
        ],
      );
}

class RowWidget extends StatelessWidget {
  final String title;
  final String icon;
  const RowWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //
          Container(
            height: 20,
            width: 20,
            child: Image.asset(
              icon,
              color: AppColors.greyPurpleColor,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          RegularText(
            text: title,
            color: AppColors.greyPurpleColor,
            size: Dimensions.font16,
          ),
        ],
      ),
    );
  }
}

class AddToPlayListBottomSheet extends StatelessWidget {
  AddToPlayListBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildSheet();
  }

  List<String> iconsList = [AppIcons.add, AppIcons.star];
  List<String> _bgImgList = [AppIcons.bigrecSkyBlue, AppIcons.rectangleRed];
  List<Color> _iconColorList = [AppColors.deepPurpleColor, Colors.white];
  List<String> _namesList = [
    "Create a new PlayList",
    "My Top Track",
  ];
  List<String> _subtitleList = [
    "",
    "50 Songs",
  ];

  Widget buildSheet({String? route}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: BoldText(
              text: "Lagan Lagi",

              //
              size: 16,
            ),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _namesList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          print("Pressed");
                          print("pressed");
                          index == 0
                              ? showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(50))),
                                  context: context,
                                  builder: ((context) =>
                                      CreateNewPlayListBottomSheet()))
                              : null;
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(_bgImgList[index]))),
                              child: Container(
                                height: 20,
                                width: 20,
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  iconsList[index],
                                  color: _iconColorList[index],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BoldText(
                                  text: _namesList[index],
                                  size: 16,
                                ),
                                RegularText(
                                  text: _subtitleList[index],
                                  size: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })))
        ],
      );
}

class CreateNewPlayListBottomSheet extends StatefulWidget {
  CreateNewPlayListBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNewPlayListBottomSheet> createState() =>
      _CreateNewPlayListBottomSheetState();
}

class _CreateNewPlayListBottomSheetState
    extends State<CreateNewPlayListBottomSheet> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildSheet(context: context);
  }

  List<String> iconsList = [AppIcons.add, AppIcons.star];

  List<String> _bgImgList = [AppIcons.bigrecSkyBlue, AppIcons.rectangleRed];

  List<Color> _iconColorList = [AppColors.deepPurpleColor, Colors.white];

  List<String> _namesList = [
    "Create a new PlayList",
    "My Top Track",
  ];

  List<String> _subtitleList = [
    "",
    "50 Songs",
  ];

  Widget buildSheet({String? route, required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.width15,
          ),
          child: BoldText(
            text: "Create New Playlist",

            //
            size: Dimensions.font16,
          ),
        ),
        SizedBox(
          height: Dimensions.height53,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.height30, right: Dimensions.height30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                height: Dimensions.height102 + 17,
                width: Dimensions.height102 + 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.height53 - 3,
                      width: Dimensions.height53 - 3,
                      child: Image.asset(AppIcons.upload),
                    ),
                    BoldText(
                      text: "Upload cover",
                      size: Dimensions.font16 - 4,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: Dimensions.height45 - 3,
                    width: Dimensions.height217 - 15,
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Enter playlist name",
                        contentPadding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                            bottom: 5,
                            top: 5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueColor),
                          borderRadius:
                              BorderRadius.circular(Dimensions.height53),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height25,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_controller.text.length > 5) {
                        context
                            .read<PlayListprovider>()
                            .openPlaylist(playlistName: _controller.text);
                        Get.back();

                        // _controller.value.;
                      } else {
                        Get.snackbar("playlist", "Too short playlist name");
                      }
                    },
                    child: Container(
                      height: Dimensions.height45 - 5,
                      width: Dimensions.height102 + 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(colors: [
                            AppColors.startGradient,
                            AppColors.endGradient
                          ])),
                      child: Center(
                        child: BoldText(
                          text: "Add",
                          color: Colors.white,
                          size: Dimensions.font16 - 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height102,
        ),
      ],
    );
  }
}

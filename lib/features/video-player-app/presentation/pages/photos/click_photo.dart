import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

import '../../widgets/big_custom_appbar.dart';

class ClickPhotoPage extends StatefulWidget {
  const ClickPhotoPage({super.key});

  @override
  State<ClickPhotoPage> createState() => _ClickPhotoPageState();
}

class _ClickPhotoPageState extends State<ClickPhotoPage> {
  void deleteShowAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 198,
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    BigBoldText(
                      text: "Delete?",
                      size: 20,
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    RegularText(
                      text: "Are you sure you want to delete?",
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: Dimensions.height25 + 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText(
                            text: "No",
                            size: 17,
                            color: Colors.grey,
                          ),
                          BigBoldText(
                            text: "Yes",
                            size: 17,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void infoShowAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 298,
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    BigBoldText(
                      text: "Properties",
                      size: 20,
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText(
                            text: "File Name",
                            size: 12,
                          ),
                          RegularText(
                            text: "IMG_3434.PNG",
                            color: Colors.black,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText(
                            text: "Location",
                            size: 12,
                          ),
                          RegularText(
                            text: "local/user/android/photos/png",
                            color: Colors.black,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText(
                            text: "File Size",
                            size: 12,
                          ),
                          RegularText(
                            text: "12kb",
                            color: Colors.black,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText(
                            text: "Resolution",
                            size: 12,
                          ),
                          RegularText(
                            text: "1200 x 1900",
                            color: Colors.black,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height25 + 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigBoldText(
                            text: "Yes",
                            size: 17,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "1/23",
        firstIcon: Icons.search,
        secondIcon: Icons.favorite_outline,
        color: Colors.transparent,
      ),
      body: Stack(children: [
        SizedBox(
          height: Dimensions.screenHeight,
          child: Image.asset(
            AppImages.elonMust,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowItem(
                        icon: Icons.video_call,
                        title: "Slide",
                      ),
                      RowItem(
                        icon: Icons.image,
                        title: "Set as",
                      ),
                      GestureDetector(
                        onTap: () {
                          print("delete");
                          deleteShowAlertDialog(context);
                        },
                        child: RowItem(
                          icon: Icons.delete,
                          title: "Delete",
                        ),
                      ),
                      RowItem(
                        icon: Icons.share,
                        title: "Share",
                      ),
                      GestureDetector(
                        onTap: () {
                          infoShowAlertDialog(context);
                        },
                        child: RowItem(
                          icon: Icons.info,
                          title: "Info",
                        ),
                      ),
                    ]),
              ),
            )),
      ]),
    );
  }
}

class RowItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const RowItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          RegularText(
            text: title,
            size: 10,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

YYDialog YYNoticeDialog() {
  return YYDialog().build()
    ..width = 120
    ..height = 110
    ..backgroundColor = Colors.black.withOpacity(0.8)
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..dismissCallBack = () {
      print("dismissCallBack invoke");
    }
    ..widget(Padding(
      padding: EdgeInsets.only(top: 21),
      child: Image.asset(
        'images/success.png',
        width: 38,
        height: 38,
      ),
    ))
    ..widget(Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Success",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}

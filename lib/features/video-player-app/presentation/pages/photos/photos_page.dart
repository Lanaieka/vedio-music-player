import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/photos/all_photos.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class PhotoHomePage extends StatefulWidget {
  const PhotoHomePage({super.key});

  @override
  State<PhotoHomePage> createState() => _PhotoHomePageState();
}

class _PhotoHomePageState extends State<PhotoHomePage> {
  final List<String> itemList = [
    "Camera",
    "Screenshots",
    "Whatsapp",
    "Instagram",
    "Facebook",
    "Birthday",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Photos",
        firstIcon: Icons.search,
        secondIcon: Icons.favorite_outline,
        color: Colors.black,
      ),
      body: GridView.count(
        // crossAxisCount is the number of columns
        crossAxisCount: 2,
        // This creates two columns with two items in each column
        children: List.generate(6, (index) {
          return Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(AllPhotosPage());
                  },
                  child: Container(
                    height: Dimensions.height157 + 8,
                    width: Dimensions.height157 + 8,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/singer.jpeg",
                            ),
                            // colorFilter:ColorFilter(c),

                            fit: BoxFit.fill)),
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: Dimensions.height30 + 5,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SizedBox(
                  width: Dimensions.height157 + 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(
                        text: itemList[index],
                        size: Dimensions.font16,
                      ),
                      RegularText(
                        text: "(33)",
                        size: Dimensions.font16 - 2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

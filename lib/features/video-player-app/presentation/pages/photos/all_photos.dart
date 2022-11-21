import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/photos/click_photo.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class AllPhotosPage extends StatefulWidget {
  const AllPhotosPage({super.key});

  @override
  State<AllPhotosPage> createState() => _AllPhotosPageState();
}

class _AllPhotosPageState extends State<AllPhotosPage> {
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
        padding: EdgeInsets.zero,
        childAspectRatio: 2 / 1.5,
        // This creates two columns with two items in each column
        children: List.generate(6, (index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                Get.to(ClickPhotoPage());
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
              ),
            ),
          );
        }),
      ),
    );
  }
}

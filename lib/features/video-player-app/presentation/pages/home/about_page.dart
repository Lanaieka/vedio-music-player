import 'package:flutter/material.dart';

import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/network_steam.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<Color?> _colorsList = [
    Color.fromARGB(255, 44, 3, 206),
    Colors.red,
    Colors.pink,
    Color.fromARGB(255, 1, 221, 255),
    Colors.red,
  ];
  List<String> _aboutList = [
    "Join our Facebook",
    "Check for Update",
    "Sahre Munch time App",
    "Offical Website",
    "Youtube"
  ];
  List<IconData> _aboutIcons = [
    Icons.facebook_rounded,
    Icons.update,
    Icons.share,
    Icons.map,
    Icons.youtube_searched_for
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SimpleCustomBar(
          title: "About",
          icon: Icons.arrow_back,
        ),
        SizedBox(
          height: Dimensions.width20,
        ),
        Image.asset(
          "assets/logo.png",
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return AboutTiles(
                    title: _aboutList[index],
                    icon: _aboutIcons[index],
                    color: _colorsList[index],
                  );
                })))
      ]),
    );
  }
}

class AboutTiles extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  const AboutTiles({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: RegularText(
          text: title,
          size: 16,
        ),
      ),
    );
  }
}

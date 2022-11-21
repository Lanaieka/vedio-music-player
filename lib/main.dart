import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/home_screen.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/music_home_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/player/orange_music_player.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/navbar_home.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/photos/sectionB/photos_B.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/theme/theme_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.-
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Player Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageNavBar(),
      // home: HomePageNavBar(),
    );
  }
}


//

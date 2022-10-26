import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:video_player/features/video-player-app/presentation/pages/themes/All_themes.dart';
import 'package:video_player/features/video-player-app/presentation/pages/videos/online_videos/all_videos.dart';
import 'package:video_player/features/video-player-app/presentation/pages/videos/online_videos/video_page.dart';

import 'features/video-player-app/presentation/pages/themes/ChangeTheme.dart';
import 'features/video-player-app/presentation/pages/themes/ChooseTheme.dart';
import 'features/video-player-app/presentation/pages/themes/FlatThemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Player Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlatThemes(),
    );
  }
}

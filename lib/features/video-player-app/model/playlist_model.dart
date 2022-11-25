import 'dart:io';

import 'package:on_audio_query/on_audio_query.dart';

class PlayListModelClass {
  String playName;

  List<SongModel> playlist;
  File? playlistImg;
  PlayListModelClass(
      {required this.playName, required this.playlist, this.playlistImg});
}

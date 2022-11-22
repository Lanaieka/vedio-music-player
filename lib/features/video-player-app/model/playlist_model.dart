import 'dart:io';

import 'package:on_audio_query/on_audio_query.dart';

class PlaylistProviderModel {
  String playName;

  List<SongModel> playlist;
  File? playlistImg;
  PlaylistProviderModel(
      {required this.playName, required this.playlist, this.playlistImg});
}

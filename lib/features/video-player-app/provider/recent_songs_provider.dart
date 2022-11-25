import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RecentPlayedProvider extends ChangeNotifier {
  final List<SongModel> _recentSongs = [];

  List<SongModel> get recentPlayerSongs => _recentSongs;

  addRecentSongs({required SongModel song}) {
    print("song : $song");
    var contain = _recentSongs.where((value) => value.uri == song.uri);
    if (contain.isEmpty) {
      _recentSongs.add(song);
    } else {
      print("song is already there");
    }
    notifyListeners();
  }
}

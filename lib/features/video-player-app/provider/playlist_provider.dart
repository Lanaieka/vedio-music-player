import 'dart:io';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/tabs/playlist_tab.dart';

import '../model/playlist_model.dart';

class PlayListprovider extends ChangeNotifier {
  List<PlayListModelClass> _playLists = [];
  List<String> _songs = ["Dill Nahi", "Dill Hare", "Yoyo", "Raste"];
  List<PlayListModelClass> get playListSongs => _playLists;
  List<String> get songs => _songs;

  openPlaylist({required String playlistName, File? playImage}) {
    // _playListsongs.add(PlaylistModel())
    _playLists.add(
      PlayListModelClass(
          playName: playlistName, playlistImg: playImage, playlist: []),
    );
  }

  addSongsInPlaylist({required SongModel song}) {
    // _playListsongs.first;
    notifyListeners();
  }

  addSong(String song) {
    _songs.add(song);
  }
}

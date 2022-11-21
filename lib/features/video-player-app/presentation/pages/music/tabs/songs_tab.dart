import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/player/orange_music_player.dart';

import '../../../Utils/dimenstion.dart';
import '../../../Utils/images.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/regular_text.dart';
import '../widgets/bottom_sheet.dart';

class SongsTab extends StatefulWidget {
  const SongsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SongsTab> createState() => _SongsTabState();
}

class _SongsTabState extends State<SongsTab> {
  final OnAudioQuery _onAudioQuery = OnAudioQuery();
  final AudioPlayer _player = AudioPlayer();

  // * more variables

  List<SongModel> songs = [];
  String currentSong = '';
  int currentIndex = 0;
  bool isPlayerVisible = false;

  void _changePlayerVisbility() {
    setState(() {
      isPlayerVisible = !isPlayerVisible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    requestStoragePermission();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();
  }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _onAudioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _onAudioQuery.permissionsRequest();
      }
      // ensure build method
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
        future: _onAudioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, item) {
          print("${item.data?.length}");

          if (item.data == null || item.data!.length == 0) {
            return Center(child: CircularProgressIndicator());
          } else {
            songs.clear();
            songs = item.data!;
            return ListView.builder(
                itemCount: item.data!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () async {
                      _changePlayerVisbility();
                      setState(() {
                        currentIndex++;
                      });
                      // Get.snackbar(
                      //     "Song Playing", "${item.data![index].title}");
                      // String? uri = item.data![currentIndex].uri;
                      // await _player
                      //     .setAudioSource(AudioSource.uri(Uri.parse(uri!)));
                      // await _player.play();
                      Get.to(OrangeMusicPlayer(
                        songs: songs,
                        currentindex: index,
                        updatedIndex: (updatedIndex) {
                          setState(() {
                            currentIndex == updatedIndex;
                          });
                        },
                      ));
                      // _player.setAudioSource(_createPlayList(item.data),
                      //     initialIndex: index);
                    },
                    child: SongsRowWidget(
                      songName: item.data![index].title,
                      subtitle: item.data![index].displayName,
                      img: QueryArtworkWidget(
                        id: item.data![index].id,
                        type: ArtworkType.AUDIO,
                      ),
                    ),
                  );
                }));
          }
        });
  }

// * create playlist
  ConcatenatingAudioSource _createPlayList(List<SongModel>? data) {
    List<AudioSource> sources = [];

    for (var song in songs) {
      sources.add(AudioSource.uri(Uri.parse(song.uri!)));
    }

    return ConcatenatingAudioSource(children: sources);
  }
}

class SongsRowWidget extends StatelessWidget {
  final String songName;
  final String subtitle;
  final QueryArtworkWidget img;
  const SongsRowWidget({
    Key? key,
    required this.songName,
    required this.subtitle,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            img,
            // Container(
            //   width: Dimensions.height65 + 3,
            //   height: Dimensions.height65 - 3,
            //   child: Image.asset(AppImages.singer1),
            // ),
            SizedBox(
              width: Dimensions.width15,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoldText(
                    text: songName,
                    size: Dimensions.font16 - 2,
                  ),
                  RegularText(
                    text: subtitle,
                    size: Dimensions.font16 - 4,
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: 40,
            color: Colors.transparent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print("bottom Sheet");
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Dimensions.height53 - 3))),
                  context: context,
                  builder: ((context) => AlbumBottomSheet()));
            },
            child: SizedBox(
              height: Dimensions.height25 - 5,
              width: Dimensions.height25 - 5,
              child: Image.asset(MusicIcons.doubeDots),
            ),
          ),
        )
      ]),
    );
  }
}

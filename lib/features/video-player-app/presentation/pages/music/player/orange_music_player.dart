import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class OrangeMusicPlayer extends StatefulWidget {
  final List<SongModel> songs;

  final int currentindex;
  final Function(int) updatedIndex;
  const OrangeMusicPlayer({
    Key? key,
    required this.songs,
    required this.currentindex,
    required this.updatedIndex,
  }) : super(key: key);

  @override
  State<OrangeMusicPlayer> createState() => _OrangeMusicPlayerState();
}

class _OrangeMusicPlayerState extends State<OrangeMusicPlayer> {
  late AnimationController animateController;

  final OnAudioQuery _onAudioQuery = OnAudioQuery();
  AudioPlayer _player = AudioPlayer();
  bool isPlayer = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late int audioIndex;
  double test = 0.0;
  final assetsAudioPlayer = AssetsAudioPlayer();

  // late Uint8List audiobytes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestStoragePermission();
    setState(() {
      audioIndex = widget.currentindex;
    });

    // assetsAudioPlayer.currentPosition.listen((event) {
    //   setState(() {
    //     position = event;
    //   });

    //   duration = Duration(seconds: 1);
    // });
  }

  void _playMusic({int? index, String? ur}) async {
    if (ur != null) {
      try {
        if (isPlayer) {
          String? uri = ur;
          assetsAudioPlayer.open(Audio.file(uri), showNotification: true);
          assetsAudioPlayer.onReadyToPlay.listen((event) {
            print("duration : ${event?.duration}");
            var onZero = Duration(seconds: 0);

            duration = event?.duration ?? onZero;

            position = assetsAudioPlayer.currentPosition.value;
          });

          // await _player.setAudioSource(AudioSource.uri(Uri.parse(uri)));
          // await _player.play();
        } else {
          // _player.pause();
          assetsAudioPlayer.pause();
        }
      } on PlayerException catch (e) {
        print("Error code: ${e.code}");

        print("Error message: ${e.message}");
      } on PlayerInterruptedException catch (e) {
        print("Connection aborted: ${e.message}");
      } catch (e) {
        print(e);
      }
    }
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

  Future<void> shareFile(String uri) async {
    // List<dynamic> docs = await DocumentsPicker.pickDocuments;
    // if (docs == null || docs.isEmpty) return null;

    // await FlutterShare.shareFile(
    //   title: 'Example share',
    //   text: 'Example share text',
    //   filePath: uri,
    // );
  }

  @override
  void dispose() {
    _player.dispose();
    // _onAudioQuery.dispose();
    assetsAudioPlayer.dispose();
    // _playMusic.dispose();

    super.dispose();
  }

  bool _changed = true;
  List<SongModel> songs = [];
  String currentSong = '';
  int currentIndex = 0;
  bool isPlayerVisible = false;
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
        future: _onAudioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, items) {
          if (items.data == null || items.data!.length == 0) {
            return Center(child: CircularProgressIndicator());
          } else {
            String? uri = items.data![audioIndex].uri;

            _playMusic(ur: uri, index: audioIndex);
          }

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
              ),
              title: Column(
                children: [
                  RegularText(
                    text: "PLAYLIST",
                    size: Dimensions.font16,
                    color: Colors.grey,
                  ),
                  BoldText(
                    text: "Classical Hit Songs",
                    size: Dimensions.font18,
                    color: Colors.white,
                  ),
                ],
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: Dimensions.height25 - 5),
                  height: Dimensions.height25,
                  width: Dimensions.height25,
                  child: Image.asset(
                    AppIcons.menuOpen,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: Container(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.4,
                      0.5,
                      0.7,
                    ],
                    colors: [
                      Color.fromARGB(255, 255, 96, 64),
                      Colors.black,
                      Color.fromARGB(255, 15, 88, 124)
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.height102 + 30,
                  ),
                  Spin(
                    manualTrigger: _changed,
                    controller: (controller) => animateController = controller,
                    duration: Duration(seconds: 5),
                    child: Container(
                      height: Dimensions.height277 + Dimensions.height25 - 2,
                      width: Dimensions.height277 + Dimensions.height25 - 2,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(50),
                        shape: BoxShape.circle,
                        // image: DecorationImage(
                        //     image: AssetImage(songsImages[audioIndex]),
                        //     fit: BoxFit.cover),
                      ),
                      child: QueryArtworkWidget(
                        id: items.data![audioIndex].id,
                        type: ArtworkType.AUDIO,
                        artworkHeight:
                            Dimensions.height277 + Dimensions.height25 - 2,
                        artworkWidth:
                            Dimensions.height277 + Dimensions.height25 - 2,
                        artworkBorder:
                            BorderRadius.circular(Dimensions.height102 - 2),
                        artworkColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height53,
                  ),
                  BigBoldText(
                    text: items.data![audioIndex].title,
                    color: Colors.white,
                    size: Dimensions.font25 - 1,
                  ),
                  SizedBox(
                    height: Dimensions.height25,
                  ),
                  RegularText(
                    text: items.data![audioIndex].displayName,
                    color: Colors.grey,
                    size: Dimensions.font20,
                  ),
                  SizedBox(
                    height: Dimensions.height25,
                  ),

                  // * Progress Bar
                  StreamBuilder<Duration>(
                      stream: assetsAudioPlayer.currentPosition,
                      builder: (context, snapshot) {
                        final pos = snapshot.data;

                        position =
                            Duration(seconds: pos == null ? 0 : pos.inSeconds);

                        print("pos : $pos");
                        return SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                pos.toString().split('.')[0],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 230,
                                child: Slider.adaptive(
                                    value: position.inSeconds.toDouble(),
                                    min: 0,
                                    max: duration.inSeconds.toDouble(),
                                    activeColor: Color(0xFFFF5500),
                                    thumbColor: Color(0xFFFF5500),
                                    inactiveColor: Colors.grey.withOpacity(.2),
                                    onChanged: (seek) {
                                      setState(() {
                                        position = seek.seconds;

                                        assetsAudioPlayer.seek(
                                          Duration(
                                            seconds: seek.toInt(),
                                          ),
                                        );
                                      });
                                      print("seek ${seek}");
                                    }),
                              ),
                              Text(
                                duration.toString().split('.')[0],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }),
                  // * Controller Row

                  Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.height70,
                      right: Dimensions.height70,
                      top: Dimensions.height25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Dimensions.height25,
                          width: Dimensions.height25,
                          child: Image.asset(
                            AppIcons.shuffle,
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_player.hasNext) {
                              _player.seekToNext();
                            }
                            // await audioPlayer
                            //     .setSource(AssetSource(audioList[audioIndex]));
                            // await audioPlayer.resume();

                            setState(() {
                              isPlayer = true;
                            });
                            if (audioIndex == 0) {
                              _player.stop();
                              setState(() {
                                audioIndex = items.data!.length - 1;
                              });
                            } else {
                              setState(() {
                                audioIndex--;
                              });
                            }
                          },
                          child: SizedBox(
                            height: Dimensions.height25,
                            width: Dimensions.height25,
                            child: Image.asset(
                              AppIcons.skipPrevious,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFFAA77),
                                  Color(0xFFFF5500),
                                ]),
                          ),
                          height: Dimensions.height70 + 10,
                          width: Dimensions.height70 + 10,
                          child: GestureDetector(
                            onTap: () async {
                              if (isPlayer) {
                                setState(() {
                                  isPlayer = false;
                                });
                                _player.pause();
                              } else {
                                setState(() {
                                  isPlayer = true;
                                });
                                await _player.play();
                              }
                            },
                            child: Icon(
                              isPlayer ? Icons.pause : Icons.play_arrow,
                              size: Dimensions.height53 - 3,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            // await audioPlayer.stop();
                            animateController.animationBehavior;

                            setState(() {
                              isPlayer = true;
                            });
                            setState(() {
                              if (audioIndex + 1 == items.data!.length) {
                                audioIndex = 0;
                                // audioPlayer
                                //     .setSource(AssetSource(audioList[audioIndex]));
                                // audioPlayer.resume();
                              } else {
                                setState(() {
                                  audioIndex++;
                                  // audioPlayer
                                  //     .setSource(AssetSource(audioList[audioIndex]));
                                  // audioPlayer.resume();
                                });
                              }
                            });
                          },
                          child: SizedBox(
                            height: Dimensions.height25,
                            width: Dimensions.height25,
                            child: Image.asset(
                              AppIcons.skipNext,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height25,
                          width: Dimensions.height25,
                          child: Image.asset(
                            AppIcons.repeat,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // * ROw

                  SizedBox(
                    height: Dimensions.height25,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.height102 - 2,
                        right: Dimensions.height102 - 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFav = !_isFav;
                                });
                              },
                              child: Icon(
                                _isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: _isFav ? Colors.red : Colors.grey,
                                size: Dimensions.height30,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.height10,
                            ),
                            RegularText(
                              text: "Love This",
                              size: Dimensions.height10 + 2,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RegularText(
                              text: "Share",
                              size: Dimensions.height10 + 2,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: Dimensions.height10,
                            ),
                            GestureDetector(
                              onTap: () {
                                shareFile(
                                    items.data![audioIndex].uri.toString());
                              },
                              child: Icon(
                                Icons.share,
                                size: Dimensions.height30,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

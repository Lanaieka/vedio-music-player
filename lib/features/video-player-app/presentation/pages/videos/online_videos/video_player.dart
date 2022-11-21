import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/notification_widget.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  List<VideoPlayerModel> _videoList = [
    VideoPlayerModel(
      name: "Bee fly",
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      thumbnail: AppImages.elonMust,
    ),
    VideoPlayerModel(
      name: "Bee fly",
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      thumbnail: AppImages.elonMust,
    ),
    VideoPlayerModel(
      name: "Bee fly",
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      thumbnail: AppImages.elonMust,
    ),
    VideoPlayerModel(
      name: "Bee fly",
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      thumbnail: AppImages.elonMust,
    ),
    VideoPlayerModel(
      name: "Bee fly",
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      thumbnail: AppImages.elonMust,
    ),
  ];
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= _videoList.length) return;
    if (!init) {
      // _controller.pause();
    }

    setState(() {
      _currentIndex = index;
    });

    _controller = VideoPlayerController.network(_videoList[_currentIndex].url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) {
        _controller.play();
      });
  }

  _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playVideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  bool _showHide = false;
  double _opacity = 0.4;

  showHideMenus() {
    setState(() {
      _opacity = 0.4;
    });
    _showHide = true;
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // _opacity = 0.1;
        _showHide = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Online Videos",
        firstIcon: Icons.abc,
        secondIcon: Icons.abc,
        color: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () async {
                  print("clicked");
                  setState(() {
                    showHideMenus();
                  });
                },
                child: Container(
                  height: Dimensions.height277 - 7,
                  width: double.infinity,
                  child: _controller.value.isInitialized
                      ? Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: Dimensions.height229 + 21,
                                  child: VideoPlayer(
                                    _controller,
                                  ),
                                ),

                                // * Menu Overlay on video
                              ],
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightBlueColor,
                          ),
                        ),
                ),
              ),
              _showHide
                  ? Positioned(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Dimensions.height15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await _controller.seekTo(Duration(
                                      seconds:
                                          _controller.value.position.inSeconds -
                                              2));
                                },
                                child: Icon(
                                  Icons.fast_rewind,
                                  color: Colors.white,
                                  size: Dimensions.height45 - 5,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                },
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print("forwarded");
                                  await _controller.seekTo(Duration(
                                      seconds:
                                          _controller.value.position.inSeconds +
                                              2));
                                },
                                child: Icon(
                                  Icons.fast_forward,
                                  color: Colors.white,
                                  size: Dimensions.height45 - 5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height53,
                          ),
                          Container(
                            height: Dimensions.height53 + 7,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(_opacity)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: Dimensions.width20,
                                ),
                                ValueListenableBuilder(
                                    valueListenable: _controller,
                                    builder: (context, VideoPlayerValue value,
                                        child) {
                                      return RegularText(
                                        text: _videoDuration(value.position)
                                            .toString(),
                                        color: Colors.white,
                                        size: Dimensions.font16 - 4,
                                      );
                                    }),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                SizedBox(
                                  height: Dimensions.width10,
                                  width: Dimensions.height229 + 20,
                                  child: VideoProgressIndicator(
                                    _controller,
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
                                      playedColor: AppColors.purpleColor,
                                      backgroundColor: Colors.white,
                                    ),
                                    // padding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.height10,
                                ),
                                RegularText(
                                  text:
                                      _videoDuration(_controller.value.duration)
                                          .toString(),
                                  color: Colors.white,
                                  size: Dimensions.font16 - 4,
                                ),
                                SizedBox(
                                  width: Dimensions.height5,
                                ),
                                Icon(
                                  Icons.fullscreen,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: Dimensions.height15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: BoldText(
                text: "Bee enjoying flowers",
                size: Dimensions.font20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width10,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: RegularText(
                  text: "Bee Hub.",
                  size: Dimensions.width15 - 1,
                )),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Divider(
            thickness: 3,
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width15),
            child: Align(
              alignment: Alignment.topLeft,
              child: BoldText(text: "More from bees", size: Dimensions.width20),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _videoList.length,
                  itemBuilder: ((context, index) {
                    return NotificationWidget(
                        onTap: () {},
                        onClick: (val) {
                          // print("hellow $val");
                          print("clicked");
                          _playVideo(
                            index: val,
                          );
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        edit: false,
                        index: index,
                        imgUrl: _videoList[index].thumbnail);
                  }))),
        ],
      ),
    );
  }
}

class VideoPlayerModel {
  final String name;
  final String url;
  final String thumbnail;

  VideoPlayerModel({
    required this.name,
    required this.url,
    required this.thumbnail,
  });
}

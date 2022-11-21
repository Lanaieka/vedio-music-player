import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/home_screen.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/music/music_home_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/photos/photos_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/browser_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/finished_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/history_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/home_site_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/progress_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/videos/online_videos/video_page.dart';

class SiteNavBar extends StatefulWidget {
  const SiteNavBar({super.key});

  @override
  State<SiteNavBar> createState() => _SiteNavBarState();
}

class _SiteNavBarState extends State<SiteNavBar> {
  final primaryColor = Color.fromARGB(255, 255, 255, 255);

  final secondaryColor = const Color(0xff6D28D9);

  final accentColor = const Color(0xffffffff);

  final backgroundColor = const Color(0xffffffff);

  final errorColor = const Color(0xffEF4444);
  int _selectIndex = 0;

  List<Widget> _pages = [
    SiteHomePage(),
    SiteBrowserPage(),
    ProgressPage(),
    StoragePage(),
    SiteHistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectIndex),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        child: SizedBox(
          height: Dimensions.height53 + 10,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimensions.height25, right: Dimensions.height25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBottomBar(
                    text: "Site",
                    icon: SiteIcons.searchBottom,
                    selected: _selectIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectIndex = 0;
                      });
                    }),
                IconBottomBar(
                    text: "Site",
                    icon: SiteIcons.site,
                    selected: _selectIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectIndex = 1;
                      });
                    }),
                IconBottomBar(
                    text: "Progress",
                    icon: SiteIcons.progress,
                    selected: _selectIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectIndex = 2;
                      });
                    }),
                IconBottomBar(
                    text: "Storage",
                    icon: SiteIcons.storange,
                    selected: _selectIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectIndex = 3;
                      });
                    }),
                IconBottomBar(
                    text: "History",
                    icon: SiteIcons.history,
                    selected: _selectIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectIndex = 4;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final String icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = Color.fromARGB(255, 255, 162, 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: Dimensions.height45 - 6,
          width: Dimensions.height45 - 5,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? accentColor : Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: GestureDetector(
              onTap: onPressed,
              child: Image.asset(icon,
                  color: selected ? Colors.white : Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: Dimensions.height10 + 2,
              height: .1,
              color: selected ? accentColor : Colors.grey),
        )
      ],
    );
  }
}

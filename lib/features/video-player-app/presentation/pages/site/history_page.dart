import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/latest_news.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/site/widgets/browser_history_widget.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/regular_text.dart';

class SiteHistoryPage extends StatefulWidget {
  const SiteHistoryPage({super.key});

  @override
  State<SiteHistoryPage> createState() => _SiteHistoryPageState();
}

class _SiteHistoryPageState extends State<SiteHistoryPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.height70,
          ),
          // * headings
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child: SizedBox(
              height: Dimensions.width20,
              child: Image.asset(AppIcons.cancelInline),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: Dimensions.width20),
            child: Align(
              alignment: Alignment.centerRight,
              child: RegularText(
                text: "Clear Browser History",
                color: Colors.grey,
                size: Dimensions.font16 - 2,
              ),
            ),
          ),

// * search bar
          SizedBox(
            height: Dimensions.height45,
          ),
          SearchField(searchController: _searchController),
          SizedBox(
            height: Dimensions.height45,
          ),

// * browser History

          Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child: BoldText(
              text: "Search History",
              size: Dimensions.font16,
            ),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),

          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  BrowserHistoryWidget(),
                  BrowserHistoryWidget(),
                  BrowserHistoryWidget(),
                ],
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimenstion.dart';
import '../../widgets/big_custom_appbar.dart';
import '../../widgets/bold_text.dart';
import '../../widgets/regular_text.dart';
import '../home/latest_news.dart';

class SearchOnlineVideo extends StatefulWidget {
  const SearchOnlineVideo({super.key});

  @override
  State<SearchOnlineVideo> createState() => _SearchOnlineVideoState();
}

class _SearchOnlineVideoState extends State<SearchOnlineVideo> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _seachesList = [
    "T Series",
    "wwe",
    "Tom & Jerry",
    "T Series",
    "Eminem - Rap God (Explicit)",
    "Movies",
    "News",
    "Punjabi Songs",
    "BB Ki Vines trending Vidoes"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Search Online Video",
        color: Colors.transparent,
        firstIcon: Icons.abc,
        secondIcon: Icons.abc,
      ),
      body: Column(children: [
        SizedBox(
          height: Dimensions.height25,
        ),
        SearchField(searchController: _searchController),
        SizedBox(
          height: Dimensions.height25,
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.width15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: BoldText(
              text: "Trending Seach",
              size: Dimensions.font20,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Row(
          children: List.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.all(Dimensions.height10),
              child: TrendingSearchesWidget(
                title: _seachesList[index],
              ),
            );
          }),
        ),
      ]),
    );
  }
}

class TrendingSearchesWidget extends StatelessWidget {
  final String title;
  const TrendingSearchesWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height25 + Dimensions.height10,
      decoration: BoxDecoration(
        color: AppColors.lightBlueColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.height10,
            right: Dimensions.height10,
            top: Dimensions.height10,
            bottom: Dimensions.height5),
        child: RegularText(
          text: "T Series",
          color: AppColors.lightBlueColor,
          size: 12,
        ),
      ),
    );
  }
}

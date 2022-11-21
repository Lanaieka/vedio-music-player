import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/small_custom_appbar.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimenstion.dart';
import '../../widgets/bold_text.dart';
import '../../widgets/regular_text.dart';
import 'news_details.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallCustomAppBar(
        title: "Lastest news",
        // icon: Icons.abc,
        color: Colors.amber,
      ),
      body: Column(
        children: [
          // Search bar

          SizedBox(
            height: Dimensions.height15,
          ),
          SearchField(searchController: _searchController)

          // News Column
          ,
          SizedBox(
            height: Dimensions.width20,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LatestNewTile(),
                  );
                })),
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height53 + 4,
        width: Dimensions.width368 + 10,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.height53 - 3),
            border: Border.all(
                color: AppColors.lightPurple.withOpacity(.7), width: 2),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  color: Colors.grey.withOpacity(.4),
                  blurRadius: 5)
            ]),
        child: TextFormField(
          controller: _searchController,
          style: TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(10),
            hintText: "Search Videos and news",
            // label: Text("hellow"),
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: Dimensions.font16),

            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: Dimensions.font20,
                right: Dimensions.font20,
                top: Dimensions.width15),
            suffixIcon: Container(
              width: 71,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.width50),
                  bottomRight: Radius.circular(Dimensions.width50),
                  topRight: Radius.circular(Dimensions.width50),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

class LatestNewTile extends StatelessWidget {
  const LatestNewTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(NewsDetailPage());
      },
      child: Container(
        margin: EdgeInsets.only(left: Dimensions.width15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Dimensions.height172 + 7,
              height: Dimensions.height102 + 6,
              child: Image.asset(
                AppImages.elonMust,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              width: Dimensions.width15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: "Eminem - Rap God"),
                SizedBox(
                  height: Dimensions.width10,
                ),
                RegularText(
                  text: "EminemVevo",
                  size: 12,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                RegularText(
                  text: "Nov 12, 2022",
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

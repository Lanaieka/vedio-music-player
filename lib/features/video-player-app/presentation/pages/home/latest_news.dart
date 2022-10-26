import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/news_details.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

import '../../Utils/colors.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RegularText(
          text: "Latest News",
          color: AppColors.mainColor,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: AppColors.mainColor,
          ),
        ),
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
        height: 57,
        width: 378,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.lightPurple, width: 2),
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
                TextStyle(color: Colors.grey, fontSize: Dimensions.font18),

            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
            suffixIcon: Container(
              width: 71,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50),
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
              width: 179,
              height: 108,
              child: Image.network(
                "https://image.cnbcfm.com/api/v1/image/107083077-1656593419933-gettyimages-1395062617-t_w16437_4934a878-972d-4bea-b6ef-b61f4ceeb787.jpeg?v=1665592117&w=929&h=523",
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimenstion.dart';
import '../../Utils/icons.dart';
import '../../widgets/bold_text.dart';
import '../../widgets/regular_text.dart';
import '../../widgets/square_widget.dart';
import 'latest_news.dart';

class NetworkSream extends StatefulWidget {
  const NetworkSream({super.key});

  @override
  State<NetworkSream> createState() => _NetworkSreamState();
}

class _NetworkSreamState extends State<NetworkSream> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleCustomBar(
            title: "Network Stram",
            icon: Icons.arrow_back_ios_new_sharp,
            secondIcon: null,
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.height25, right: Dimensions.height25),
            child: BoldText(
              text: "Neter Network URL",
              size: Dimensions.font16,
            ),
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          SearchField(searchController: _searchController),
          SizedBox(
            height: Dimensions.height45,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.height70 + 10,
                right: Dimensions.height70 + 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquareWidget(
                  onClick: () {},
                  bgImg: HomeIcons.playTile,
                  title: "Play",
                  iconColor: Colors.transparent,
                  index: 1,
                ),
                SquareWidget(
                  onClick: () {},
                  bgImg: HomeIcons.cancelTile,
                  title: "Cancel",
                  iconColor: Colors.transparent,
                  index: 1,
                ),
                SquareWidget(
                  onClick: () {},
                  bgImg: HomeIcons.resetTile,
                  title: "Reset",
                  iconColor: Colors.transparent,
                  index: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleCustomBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? secondIcon;

  const SimpleCustomBar({
    Key? key,
    required this.title,
    required this.icon,
    this.secondIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.width10 + Dimensions.height25),
      height: Dimensions.height102 - 2,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 0.5),
          blurRadius: 5,
        )
      ]),
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.width15,
          right: Dimensions.width15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.mainColor,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: Dimensions.height5,
                ),
                RegularText(
                  text: title,
                  color: AppColors.mainColor,
                  size: Dimensions.font22,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/dimenstion.dart';
import '../../../widgets/regular_text.dart';
import '../Tools/notification/Notification_page.dart';

class WhatsAppStatus extends StatefulWidget {
  const WhatsAppStatus({super.key});

  @override
  State<WhatsAppStatus> createState() => _WhatsAppStatusState();
}

class _WhatsAppStatusState extends State<WhatsAppStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            onClick: () {},
            icon: Icons.search,
            secondIcon: Icons.more_vert,
            title: "WhatsApp Status",
            iconColor: Colors.black,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.width10 - 2),
            child: Row(
              children: [
                Container(
                  height: Dimensions.height30 + 4,
                  width: Dimensions.height96,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlueColor,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: AppColors.lightPurple),
                  ),
                  child: Center(
                      child: RegularText(
                    text: "Video",
                    color: Colors.white,
                    size: Dimensions.font16 - 2,
                  )),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  height: Dimensions.height30 + 4,
                  width: Dimensions.height96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.lightPurple),
                  ),
                  child: Center(
                      child: RegularText(
                    text: "Photos",
                    size: Dimensions.font16 - 2,
                  )),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Flexible(
            child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: Dimensions.width10,
                mainAxisSpacing: Dimensions.height45 - 5,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width15, right: Dimensions.width15),
                    child: WhatsAppVideoWidget(),
                  );
                })),
          )
        ],
      ),
    );
  }
}

class WhatsAppVideoWidget extends StatelessWidget {
  const WhatsAppVideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.height217,
          // width: 169,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 0.4,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                    color: Colors.grey.withOpacity(.5))
              ]),
          child: Column(
            children: [
              Container(
                height: Dimensions.height172,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          AppImages.elonMust,
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width10 - 2,
                    right: Dimensions.width10 - 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText(
                      text: "434344243",
                      size: Dimensions.font16 - 4,
                    ),
                    SizedBox(
                      height: Dimensions.width20,
                      width: Dimensions.width15,
                      child: Image.asset(AppIcons.shareInsta),
                    ),
                    SizedBox(
                      height: Dimensions.width20,
                      width: Dimensions.width15,
                      child: Image.asset(HomeIcons.statusDownload),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: Dimensions.height65 - 5,
          left: 0,
          right: 0,
          child: Center(
              child: SizedBox(
                  height: Dimensions.height53 - 3,
                  width: Dimensions.height53 - 3,
                  child: Image.asset(HomeIcons.statusPlay))),
        ),
      ],
    );
  }
}

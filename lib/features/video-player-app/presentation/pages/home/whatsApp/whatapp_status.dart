import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/colors.dart';
import 'package:video_player/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player/features/video-player-app/presentation/pages/home/Tools/notification/Notification_page.dart';
import 'package:video_player/features/video-player-app/presentation/widgets/regular_text.dart';

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
            icon: Icons.search,
            secondIcon: Icons.menu,
            title: "WhatsApp Status",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.lightPurple),
                  ),
                  child: Center(child: RegularText(text: "Video")),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 34,
                  width: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.lightPurple),
                  ),
                  child: Center(child: RegularText(text: "Video")),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Flexible(
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
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
          height: 210,
          // width: 169,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, offset: Offset(0, 3), color: Colors.grey)
              ]),
          child: Column(
            children: [
              Container(
                height: 177,
                child: Image.network(
                  "https://media.istockphoto.com/photos/carefree-africanamerican-girl-in-studio-picture-id1285993433?b=1&k=20&m=1285993433&s=612x612&w=0&h=APXWawlfI7VMjW36mpiDV03dU7nfOjiKGtLXoWFLhpU=",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: Dimensions.height5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText(
                      text: "434344243",
                      size: 12,
                    ),
                    Icon(Icons.share),
                    Icon(Icons.download),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Center(
              child: Icon(
            Icons.play_arrow_sharp,
            color: Colors.white,
            size: Dimensions.height25 + 10,
          )),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/small_custom_appbar.dart';

import '../../../Utils/dimenstion.dart';
import '../../../widgets/regular_text.dart';
import '../network_steam.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final List<SettingModel> _videoPlayer = [
    SettingModel(
      title: "Display lock & Battery",
      subtitle: "Hide",
      icon: Icons.dark_mode_sharp,
      color: Color.fromARGB(255, 3, 112, 220),
      isSwitch: true,
    ),
    SettingModel(
      title: "Skip Video",
      subtitle: "10 sec",
      icon: Icons.sunny,
      color: Color.fromARGB(255, 220, 3, 3),
      isSwitch: false,
    ),
    SettingModel(
      title: "Auto play next",
      subtitle: "Off",
      icon: Icons.rotate_right_outlined,
      color: Color.fromARGB(255, 220, 101, 3),
      isSwitch: true,
    ),
    SettingModel(
      title: "orientation",
      subtitle: "Off",
      icon: Icons.block,
      color: Color.fromARGB(255, 220, 3, 3),
      isSwitch: true,
    ),
  ];
  final List<SettingModel> _browsingList = [
    SettingModel(
      title: "Clear Cache",
      subtitle: "",
      icon: Icons.brush,
      color: Color.fromARGB(255, 220, 169, 3),
      isSwitch: false,
    ),
    SettingModel(
      title: "Clear Cookies",
      subtitle: "",
      icon: Icons.cookie,
      color: Color.fromARGB(255, 0, 204, 255),
      isSwitch: false,
    ),
    SettingModel(
      title: "Clear Browser History",
      subtitle: "",
      icon: Icons.brush_sharp,
      color: Color.fromARGB(255, 220, 3, 3),
      isSwitch: false,
    ),
  ];
  final List<SettingModel> _generalTilesList = [
    SettingModel(
      title: "Dark Mode",
      subtitle: "Enable Dark Mode",
      icon: Icons.dark_mode_outlined,
      color: Color.fromARGB(255, 54, 93, 222),
      isSwitch: true,
    ),
    SettingModel(
      title: "Themes",
      subtitle: "Change application theme",
      icon: Icons.sunny,
      color: Color.fromARGB(255, 225, 5, 5),
      isSwitch: false,
    ),
    SettingModel(
      title: "Language",
      subtitle: "English (US)",
      icon: Icons.language,
      color: Color.fromARGB(255, 173, 8, 179),
      isSwitch: false,
    ),
    SettingModel(
      title: "Recognise hidden files and",
      subtitle:
          "recognize all hidden file. It can take more time to scan video files.",
      icon: Icons.remove_red_eye,
      color: Color.fromARGB(255, 7, 63, 246),
      isSwitch: true,
    ),
    SettingModel(
      title: "Show recently played on how",
      subtitle: "Enable Dark Mode",
      icon: Icons.timelapse,
      color: Color.fromARGB(255, 3, 187, 43),
      isSwitch: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallCustomAppBar(
        title: "Setting",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.height15),
              child: RegularText(
                text: "General",
                color: Colors.black,
                size: Dimensions.font16 - 2,
              ),
            ),
            Container(
                height: Dimensions.height383 - Dimensions.height30 + 3,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: _generalTilesList.length,
                    itemBuilder: ((context, index) {
                      return ProfilesListTile(
                        title: _generalTilesList[index].title,
                        subtitle: _generalTilesList[index].subtitle,
                        icon: _generalTilesList[index].icon,
                        isSwitch: _generalTilesList[index].isSwitch,
                        color: _generalTilesList[index].color,
                      );
                    }))),
            Padding(
              padding: EdgeInsets.all(Dimensions.height15),
              child: RegularText(
                text: "Browsing",
                color: Colors.black,
                size: Dimensions.font16 - 2,
              ),
            ),
            Container(
              height: Dimensions.height217 - Dimensions.height15,
              child: Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      itemCount: _browsingList.length,
                      itemBuilder: ((context, index) {
                        return ProfilesListTile(
                            title: _browsingList[index].title,
                            icon: _browsingList[index].icon,
                            isSwitch: _browsingList[index].isSwitch,
                            subtitle: _browsingList[index].subtitle,
                            color: _browsingList[index].color);
                      }))),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.height15),
              child: RegularText(
                text: "Video Player",
                color: Colors.black,
                size: Dimensions.height15 - 1,
              ),
            ),
            Container(
              height: Dimensions.height383 - Dimensions.height70 - 10,
              child: Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      itemCount: _videoPlayer.length,
                      itemBuilder: ((context, index) {
                        return ProfilesListTile(
                            title: _videoPlayer[index].title,
                            icon: _videoPlayer[index].icon,
                            isSwitch: _videoPlayer[index].isSwitch,
                            subtitle: _videoPlayer[index].subtitle,
                            color: _videoPlayer[index].color);
                      }))),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilesListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool? isSwitch;
  final String subtitle;
  final Color? color;

  const ProfilesListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSwitch,
    required this.subtitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height70,
      child: ListTile(
        title: RegularText(
          text: title,
          size: Dimensions.font18,
        ),
        leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            )),
        subtitle: RegularText(
          text: subtitle,
          color: Colors.grey,
          size: Dimensions.font16 - 4,
        ),
        trailing: isSwitch != false
            ? Switch(
                onChanged: (value) {},
                value: false,
              )
            : Text(""),
      ),
    );
  }
}

class SettingModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? color;
  final bool isSwitch;
  SettingModel(
      {required this.color,
      required this.title,
      required this.icon,
      required this.isSwitch,
      required this.subtitle});
}

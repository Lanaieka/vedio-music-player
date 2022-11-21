import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';

import '../../../widgets/bold_text.dart';
import '../../../widgets/regular_text.dart';
import '../network_steam.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<String> _langList = [
    "English",
    "Bahasa Indonesia",
    "hindi",
    "Urdu",
    "Türkçe",
    "English",
    "Bahasa Indonesia",
    "hindi",
    "Urdu",
    "Türkçe"
  ];
  List<String> _subList = [
    "English (US)",
    "Indonesia",
    "hindi (india)",
    "Urdu",
    "Türkçe (Turkish)",
    "English (US)",
    "Indonesia",
    "hindi (india)",
    "Urdu",
    "Türkçe (Turkish)"
  ];
  int _selectLang = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SimpleCustomBar(
          title: "Language",
          icon: Icons.arrow_back_ios_new_sharp,
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: _langList.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectLang = index;
                        });
                      },
                      child: LanguageList(
                        tick: _selectLang == index ? true : false,
                        title: _langList[index],
                        subtitle: _subList[index],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.withOpacity(.2),
                    ),
                  ],
                );
              })),
        )
      ]),
    );
  }
}

class LanguageList extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool tick;
  const LanguageList({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.tick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // minVerticalPadding: 2,
      title: BoldText(
        text: title,
        size: Dimensions.font16,
      ),
      subtitle: RegularText(
        text: subtitle,
        size: Dimensions.font16 - 4,
      ),
      trailing: tick
          ? Container(
              height: Dimensions.height30,
              width: Dimensions.height30,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          : Text(""),
    );
  }
}

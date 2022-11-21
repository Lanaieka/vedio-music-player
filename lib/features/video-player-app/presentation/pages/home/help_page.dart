import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';

import '../../Utils/dimenstion.dart';
import '../../widgets/bold_text.dart';
import 'network_steam.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final List<Color?> _colorsList = [
    Color.fromARGB(255, 44, 3, 206),
    Colors.red,
    Colors.pink,
    Color.fromARGB(255, 1, 221, 255),
    Colors.red,
  ];
  List<String> _aboutList = [
    "Join our Facebook",
    "Check for Update",
    "Sahre Munch time App",
    "Offical Website",
    "Youtube"
  ];
  List<String> _aboutIcons = [
    HomeIcons.helpPlay,
    HomeIcons.helpMusic,
    HomeIcons.helpDown,
    HomeIcons.helpBrowse,
    HomeIcons.helpprivacy,
  ];
  final List<Entry> data = <Entry>[
    Entry("Video", <Entry>[
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
    ]),
    Entry("Music", <Entry>[
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
    ]),
    Entry("Download", <Entry>[
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
    ]),
    Entry("Browse", <Entry>[
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
    ]),
    Entry("Priavcy", <Entry>[
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
      Entry("Q1 : What is the use of videp feature"),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // App bar
        SimpleCustomBar(
          title: "Help",
          icon: Icons.wallet,
        ),
        // Title
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.height15,
              ),
              BoldText(
                text: "Help & Feedback",
                size: Dimensions.font20,
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return EntryItem(
                      entry: data[index],
                      icon: _aboutIcons[index],
                      color: _colorsList[index]);
                })))
        // ListTiles
      ]),
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem({
    Key? key,
    required this.entry,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final Entry entry;
  final String icon;
  final Color? color;

// This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return Container(
        height: Dimensions.height45 - 5,
        child: ListTile(
          title: Text(root.title),
        ),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      leading: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: color,
        ),
        child: Image.asset(
          icon,
          // color: Colors.white,
        ),
      ),
      title: BoldText(
        text: root.title,
        size: 16,
      ),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

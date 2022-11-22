// import 'package:flutter/material.dart';
// import 'package:video_player_app/features/video-player-app/presentation/Utils/icons.dart';
// import 'package:video_player_app/features/video-player-app/presentation/pages/music/widgets/bottom_sheet.dart';

// import '../../../Utils/dimenstion.dart';
// import '../../../Utils/images.dart';
// import '../../../widgets/bold_text.dart';
// import '../../../widgets/regular_text.dart';

// class SongsRowWidget extends StatelessWidget {
//   const SongsRowWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Row(
//           children: [
//             Container(
//               width: 68,
//               height: 62,
//               child: Image.asset(AppImages.singer1),
//             ),
//             SizedBox(
//               width: Dimensions.width15,
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   BoldText(
//                     text: "Raja Raja Cholan",
//                     size: 14,
//                   ),
//                   RegularText(
//                     text: "IIayaraja",
//                     size: 12,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         GestureDetector(
//             onTap: () {
//               print("bottom Sheet");
//               showModalBottomSheet(
//                   shape: RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(50))),
//                   context: context,
//                   builder: ((context) => AlbumBottomSheet()));
//             },
//             child: SizedBox(
//                 height: Dimensions.height25 - 3,
//                 width: Dimensions.height25 - 3,
//                 child: Image.asset(MusicIcons.doubeDots))),
//       ]),
//     );
//   }

//   Future<dynamic> BottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Column(
//             children: [
//               BoldText(
//                 text: "Lagan lagi",
//                 size: 30,
//                 color: Colors.black,
//               ),
//             ],
//           );
//         });
//   }
// }

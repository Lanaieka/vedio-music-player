import 'package:flutter/material.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/small_custom_appbar.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimenstion.dart';
import '../../widgets/bold_text.dart';
import '../../widgets/regular_text.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallCustomAppBar(
        title: "News",
        icon: Icons.share,
        color: AppColors.mainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: Dimensions.height172 + Dimensions.height15 + 3,
            width: double.infinity,
            child: Image.asset(
              AppImages.elonMust,
              fit: BoxFit.cover,
            ),
          )

          // Details
          ,
          SizedBox(
            height: Dimensions.height15,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width15, right: Dimensions.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: "Elon Must Buys Twitter",
                  size: Dimensions.font25 - 1,
                ),
                RegularText(
                  text: "EminemVevo",
                  size: Dimensions.font16 - 4,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                RegularText(
                  text:
                      "Elon Reeve Musk FRS is a business magnate and investor. He is the founder, CEO, and chief engineer of SpaceX; angel investor, CEO, and product architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI.Elon Reeve Musk FRS is a business magnate and investor. He is the founder, CEO, and chief engineer of SpaceX; angel investor, CEO, and product architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI.Elon Reeve Musk FRS is a business magnate and investor. He is the founder, CEO, and chief engineer of SpaceX; angel investor, CEO, and product architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI.Elon Reeve Musk FRS is a business magnate and investor. He is the founder, CEO, and chief engineer of SpaceX; angel investor, CEO, and product architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI.Elon Reeve Musk FRS is a business magnate and investor. He is the founder, CEO, and chief engineer of SpaceX; angel investor, CEO, and product architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI.Elon Reeve Musk FRS is a business magnate and investor. He is the founder, CEO, and chief engineer of SpaceX; angel investor, CEO, and product architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI.",
                  size: Dimensions.font16 - 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

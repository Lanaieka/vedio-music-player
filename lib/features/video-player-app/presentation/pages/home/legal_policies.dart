import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/feedback/feedback_page.dart';
import 'package:video_player_app/features/video-player-app/presentation/pages/home/privacy_policies.dart';

import '../../Utils/dimenstion.dart';
import '../../widgets/regular_text.dart';
import 'network_steam.dart';

class LegalPliciiesPage extends StatefulWidget {
  const LegalPliciiesPage({super.key});

  @override
  State<LegalPliciiesPage> createState() => _LegalPliciiesPageState();
}

class _LegalPliciiesPageState extends State<LegalPliciiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SimpleCustomBar(title: "Legal Policies", icon: Icons.abc),
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RegularText(
                text: "Legal Policies",
                size: Dimensions.font16,
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RegularText(
                text:
                    "Legal policy is a set of ideas, tasks, programs, methods for the formation and development, regulation and protection of public relations through law.Legal policy is a set of ideas, tasks, programs, methods for the formation and development, regulation and protection of public relations through law.",
                size: Dimensions.font16,
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RegularText(
                text:
                    "Legal policy is a set of ideas, tasks, programs, methods for the formation and development, regulation and protection of public relations through law.Legal policy is a set of ideas, tasks, programs, methods for the formation and development, regulation and protection of public relations through law.",
                size: Dimensions.font16,
              ),
            ),
          ]),
          Positioned(
              bottom: Dimensions.width20,
              left: Dimensions.width50,
              right: Dimensions.width50,
              child: Column(
                children: [
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(PrivacyPoliciesPage());
                      },
                      child: Container(
                        height: Dimensions.height65 - 3,
                        width: Dimensions.screenWidth * .8,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              BorderRadius.circular(Dimensions.width20),
                        ),
                        child: Center(
                          child: RegularText(
                            text: "Privacy Policy",
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(FeedbackPage());
                    },
                    child: Container(
                      height: Dimensions.height65 - 3,
                      width: Dimensions.screenWidth * .8,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(Dimensions.width20),
                      ),
                      child: Center(
                        child: RegularText(
                          text: "Feedback",
                          size: Dimensions.font16,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

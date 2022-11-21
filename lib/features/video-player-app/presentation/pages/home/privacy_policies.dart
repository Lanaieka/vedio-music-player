import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Utils/dimenstion.dart';
import '../../widgets/regular_text.dart';
import 'network_steam.dart';

class PrivacyPoliciesPage extends StatelessWidget {
  const PrivacyPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SimpleCustomBar(
              title: "Privacy Policies",
              icon: Icons.abc,
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: EdgeInsets.all(
                Dimensions.width15,
              ),
              child: RegularText(
                text: "Privacy Policies",
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
                    "Policy is a deliberate system of guidelines to guide decisions and achieve rational outcomes. A policy is a statement of intent and is implemented as a procedure or protocol. Policies are generally adopted by a governance body within an organization.",
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
                size: 16,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

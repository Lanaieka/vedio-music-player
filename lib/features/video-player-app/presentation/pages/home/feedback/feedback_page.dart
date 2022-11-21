import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/dimenstion.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/custom_button.dart';
import '../network_steam.dart';
import '../widgets/custom_text_field.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SimpleCustomBar(title: "Feedback", icon: Icons.abc),
        SizedBox(
          height: Dimensions.height25,
        ),
        BoldText(
          text: "Help us to improbe this APP!!",
          size: Dimensions.font20,
          color: AppColors.lightBlueColor,
        ),
        SizedBox(
          height: Dimensions.height25,
        ),
        Form(
            child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              title: "Your Name",
              hintText: "Enter you name",
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            CustomTextField(
              controller: _emailController,
              title: "Email",
              hintText: "Enter Email",
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            CustomTextField(
              controller: _feedbackController,
              title: "Feedback",
              hintText: "Enter your Feedback",
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
          ],
        )),
        CustomButton(
          onClick: () {},
          color: AppColors.deepPurpleColor,
          title: "SUBMIT",
        )
      ]),
    );
  }
}

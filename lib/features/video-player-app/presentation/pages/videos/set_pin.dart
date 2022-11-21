import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/colors.dart';

import 'package:video_player_app/features/video-player-app/presentation/Utils/dimenstion.dart';
import 'package:video_player_app/features/video-player-app/presentation/Utils/images.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/big_custom_appbar.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/bold_text.dart';
import 'package:video_player_app/features/video-player-app/presentation/widgets/custom_button.dart';

class SetPinPage extends StatefulWidget {
  const SetPinPage({super.key});

  @override
  State<SetPinPage> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;

  final List<String> numbersList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];

  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(1, 71, 71, 71),
      appBar: BigCustomAppBar(
        title: "Private Videos",
        firstIcon: Icons.abc,
        secondIcon: Icons.abc,
        color: Colors.transparent,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: Dimensions.height25,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 100,
            child: Image.asset(AppImages.pin),
          ),
        ),

        // * pin code fields/

        SizedBox(
          width: 300,
          child: PinCodeTextField(
            length: 4,
            obscureText: true,
            animationType: AnimationType.fade,

            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              inactiveColor: Colors.black,
              activeColor: Colors.black,
              // borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            keyboardType: TextInputType.visiblePassword,
            animationDuration: Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            // enableActiveFill: true,

            errorAnimationController: errorController,
            controller: textEditingController,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {
              print(value);
              setState(() {
                // currentText = value;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
            appContext: context,
          ),
        ),
        SizedBox(
          height: Dimensions.height25,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Wrap(
            spacing: 40,
            children: [
              for (int i = 0; i < 9; i++) ButtonWidget(number: numbersList[i])
            ],
          ),
        ),

        ButtonWidget(number: "0"),

        SizedBox(
          height: Dimensions.height25,
        ),

        CustomButton(
            title: "Next", color: AppColors.lightBlueColor, onClick: () {}),
      ]),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String number;
  const ButtonWidget({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 73,
      width: 73,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [BoxShadow()]),
      child: Center(
        child: BoldText(
          text: number,
          size: 36,
        ),
      ),
    );
  }
}

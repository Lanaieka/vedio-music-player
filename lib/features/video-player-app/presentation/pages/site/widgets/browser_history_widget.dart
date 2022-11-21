import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/icons.dart';
import '../../../widgets/bold_text.dart';
import '../../../widgets/regular_text.dart';

class BrowserHistoryWidget extends StatelessWidget {
  const BrowserHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 59,
        width: 359,
        decoration: BoxDecoration(
          color: AppColors.lightPurple.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(AppIcons.browser),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoldText(
                  text: "Brown Rang - google",
                  size: 16,
                ),
                RegularText(
                  text: "https://www.google.co.uk",
                  size: 10,
                ),
              ],
            ),
            Icon(
              Icons.cancel,
              color: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}

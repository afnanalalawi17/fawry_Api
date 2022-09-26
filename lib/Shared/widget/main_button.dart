import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../color/colors.dart';
import 'constants.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  const MainButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightApp * 0.066,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: press,
        child: Center(
          child: Text(
            text!.tr,
           style:    Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}

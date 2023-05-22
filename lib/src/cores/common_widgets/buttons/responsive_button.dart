import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/option_color.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;

  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);
  ResponsiveButton.text(
      {Key? key, this.width, this.isResponsive = false, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive! ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: OptionAppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive!
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            text != null
                ? Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
                : const Text('')
          ],
        ),
      ),
    );
  }
}

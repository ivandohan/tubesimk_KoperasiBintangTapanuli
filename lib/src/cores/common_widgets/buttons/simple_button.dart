import 'package:flutter/widgets.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/option_color.dart';

class SimpleButton extends StatelessWidget {
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  double? textSize;
  Color? textColor;

  SimpleButton(
      {Key? key,
        required this.backgroundColor,
        required this.size,
        required this.borderColor})
      : super(key: key);

  SimpleButton.icon(
      {Key? key,
        this.icon,
        required this.backgroundColor,
        required this.size,
        required this.borderColor})
      : super(key: key);

  SimpleButton.text(
      {Key? key,
        this.text,
        this.textSize,
        this.textColor,
        required this.backgroundColor,
        required this.borderColor,
        required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: icon == null
          ? Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: textSize!,
              color: textColor!,
            ),
          ))
          : Center(
          child: Icon(
            icon,
            color: OptionAppColors.mainColor,
          )),
    );
  }
}

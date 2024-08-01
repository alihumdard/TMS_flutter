import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
//text widget

Widget text(text,
    {var fontSize,
    Color? textColor,
    var fontFamily,
    var isCentered = false,
    var maxLine,
    var decoration,
    var overFlow,
    TextAlign? align,
    var latterSpacing = 0.5,
    bool textAllCaps = false,
    var isLongText = false,
    bool lineThrough = false,
    var fontWeight}) {
  return Text(
    textAllCaps ? text! : text!,
    textAlign: align,
    maxLines: isLongText ? null : maxLine,
    overflow: overFlow,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: textColor ?? black,
      // height: 1.5,
      letterSpacing: latterSpacing,
      decoration: decoration,
    ),
  );
}
//welcome rich text

class WelcomeRichtext extends StatelessWidget {
  const WelcomeRichtext({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: const [
          TextSpan(
            text: "to",
            style: TextStyle(
              wordSpacing: 5.0,
              fontWeight: FontWeight.w700,
              fontSize: size40,
            ),
          ),
          WidgetSpan(
              child: SizedBox(
            width: size5,
          )),
          TextSpan(
            text: "TMS",
            style: TextStyle(
              wordSpacing: 5.0,
              color: primary_color,
              fontWeight: FontWeight.w700,
              fontSize: size40,
            ),
          ),
        ],
      ),
    );
  }
}

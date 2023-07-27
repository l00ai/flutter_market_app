import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';

class Booster {

  Booster._();

  static textBody(String text, {Color color = LightThemeColors.bodyTextColor, double fontSize = 16, FontWeight fontWeight = FontWeight.normal, TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }


  static textTitle(String text, {Color color = LightThemeColors.bodyTextColor, double fontSize = 20, FontWeight fontWeight = FontWeight.bold, TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }

}
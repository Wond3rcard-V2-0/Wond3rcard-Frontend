import 'package:flutter/material.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_constants.dart';

class WonderCardTypography {
  static TextStyle regularTextTitle1({
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
      fontFamily: AppConstants.wonderCardFontName,
      fontSize: fontSize ?? size19,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.grayScale700,
    );
  }

  static TextStyle regularTextTitle2({
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
      fontFamily: AppConstants.wonderCardFontName,
      fontSize: fontSize ?? SpacingConstants.size16,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.grayScale500,
    );
  }

  static TextStyle regularTextTitle2Bold({
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
      fontFamily: AppConstants.wonderCardFontName,
      fontSize: fontSize ?? SpacingConstants.size16,
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.defaultWhite,
    );
  }

  static TextStyle hintTextSytle({
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? SpacingConstants.size14,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.hintTextColor,
    );
  }

  static TextStyle boldTextTitle2({
    String? fontName,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
        fontFamily: fontName ?? AppConstants.wonderCardFontName,
        fontSize: fontSize ?? SpacingConstants.size16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.grayScale500);
  }

  static TextStyle boldTextH4({double? fontSize, Color? color}) {
    return TextStyle(
        fontFamily: 'Barlow',
        fontSize: fontSize ?? SpacingConstants.size28,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.defaultWhite);
  }

  static TextStyle boldTextH5({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Barlow',
      fontSize: fontSize ?? SpacingConstants.size23,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.primaryShade,
    );
  }

  static TextStyle boldTextTitleBold({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Barlow',
      fontSize: fontSize ?? SpacingConstants.size18,
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.grayScale,
    );
  }

  static TextStyle boldTextBody({
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    Color? color,
  }) {
    return TextStyle(
        fontFamily: wonderCardFontName,
        fontSize: fontSize ?? SpacingConstants.size13,
        // fontWeight: fontWeight ?? FontWeight.w700,
        // height: height ?? SpacingConstants.size13,
        color: color ?? AppColors.primaryShade);
  }

  static TextStyle captionBold() {
    return const TextStyle(
        fontFamily: 'Barlow', fontSize: 11, fontWeight: FontWeight.w700);
  }

  static TextStyle adminSideNavTextStyle({Color? color, double? fontSize}){
    return TextStyle(
color: color ??  Color(0xff212121),
fontFamily: 'Barlow',
fontSize: fontSize ?? 21,
fontStyle: FontStyle.normal,
fontWeight: FontWeight.w400,
    );
  }


  static TextStyle headlineH2({Color? color, double? fontSize, FontWeight? fontWeight}){
    return TextStyle(
color: color ?? AppColors.primaryShade,
fontFamily: 'Lato',
fontSize: fontSize ?? 25.63,
fontStyle: FontStyle.normal,
fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

static TextStyle titleH6({ Color? color, double? fontSize}){
  return TextStyle(
color: color ??  Color(0xff6E39CB),
fontFamily: 'Lato',
fontSize: fontSize ??  16,
fontStyle: FontStyle.normal,
fontWeight: FontWeight.w500,
  );
}


}

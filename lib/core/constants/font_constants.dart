import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

class Fonts {
  static const String lato = "Lato";

  static const String quicksand = "Quicksand";

  static const String emoji = "OpenSansEmoji";
  static const String raleway = "Raleway";
  static const String fraunces = "Fraunces";
  static const montserrat = 'Montserrat';
  static const montserratAlternates = 'MontserratAlternates';
}

class TextStyles {
  static const TextStyle lato = TextStyle(
    fontFamily: Fonts.lato,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    height: 1,
    fontFamilyFallback: [
      Fonts.emoji,
    ],
  );

  static const TextStyle quicksand = TextStyle(
    fontFamily: Fonts.quicksand,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    fontFamilyFallback: [
      Fonts.emoji,
    ],
  );

  static TextStyle profileTitleTextStyle = TextStyle(
    fontSize: FontSizes.s14,
    fontWeight: FontWeight.w700,
    fontFamily: Fonts.montserratAlternates,
  );
  static TextStyle chatsViewIOSTitleTextStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: Fonts.montserratAlternates,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );

  static TextStyle profilesubTitleTextStyle = TextStyle(
      fontFamily: Fonts.montserrat,
      color: Styles.FontColorDarkGray1,
      fontSize: FontSizes.s12,
      fontWeight: FontWeight.normal);

  static const TextStyle montserrat = TextStyle(
    fontFamily: Fonts.montserrat,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    height: 1,
  );

  static TextStyle get settingsTitleStyle => montserrat.copyWith(
        fontFamily: Fonts.montserrat,
        fontSize: FontSizes.s14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get settingsSubtitleStyle => montserrat.copyWith(
        fontFamily: Fonts.montserrat,
        fontSize: 11.sp,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get T1 =>
      montserrat.bold.size(FontSizes.s14).letterSpace(.7);

  static TextStyle get T2 =>
      montserrat.bold.size(FontSizes.s12).letterSpace(.4);

  static TextStyle get H1 => montserrat.bold.size(FontSizes.s14);

  static TextStyle get H2 => montserrat.bold.size(FontSizes.s12);

  static TextStyle get Body1 => montserrat.size(FontSizes.s14);

  static TextStyle get Body2 => montserrat.size(FontSizes.s12);

  static TextStyle get Body3 => montserrat.size(FontSizes.s11);

  static TextStyle get Body4 => montserrat.size(FontSizes.s10);

  static TextStyle get Callout =>
      quicksand.size(FontSizes.s14).letterSpace(1.75.h);

  static TextStyle get CalloutFocus => Callout.bold;

  static TextStyle get Btn =>
      quicksand.bold.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get BtnSelected =>
      quicksand.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get Footnote => quicksand.bold.size(FontSizes.s11);

  static TextStyle get Caption => lato.size(FontSizes.s11).letterSpace(.3);
  static const TextStyle raleway = TextStyle(
      fontFamily: Fonts.raleway, fontWeight: FontWeight.w700, height: 1);
  static const TextStyle fraunces = TextStyle(
      fontFamily: Fonts.fraunces, fontWeight: FontWeight.w400, height: 1);

  static TextStyle get h1 => montserrat.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: FontSizes.s48,
      letterSpacing: -1,
      height: 1.17);

  static TextStyle get h2 =>
      h1.copyWith(fontSize: FontSizes.s24, letterSpacing: -.5, height: 1.16);

  static TextStyle get h2_5 =>
      h1.copyWith(fontSize: FontSizes.s18, letterSpacing: -.5, height: 1.16);

  static TextStyle get h3 =>
      h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);

  static TextStyle get h4 =>
      h1.copyWith(fontSize: FontSizes.s10, letterSpacing: -.05, height: 1.29);

  static TextStyle get h5 =>
      h1.copyWith(fontSize: FontSizes.s8, letterSpacing: -.05, height: 1.29);

  static TextStyle get title1 => raleway.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s16, height: 1.31);

  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s14, height: 1.36);

  static TextStyle get body1 => raleway.copyWith(
      fontWeight: FontWeight.normal, fontSize: FontSizes.s14, height: 1.71);

  static TextStyle get body2 =>
      body1.copyWith(fontSize: FontSizes.s12, height: 1.5, letterSpacing: .2);

  static TextStyle get body3 => body1.copyWith(
      fontSize: FontSizes.s12, height: 1.5, fontWeight: FontWeight.bold);

  static TextStyle get callout1 => raleway.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: FontSizes.s12,
      height: 1.17,
      letterSpacing: .5);

  static TextStyle get callout2 =>
      callout1.copyWith(fontSize: FontSizes.s10, height: 1, letterSpacing: .25);

  static TextStyle get caption => raleway.copyWith(
      fontWeight: FontWeight.w800, fontSize: FontSizes.s11, height: 1.36);

  static TextStyle get dialog => h5.copyWith(
      color: Styles.ColorUpdateDialog,
      fontSize: FontSizes.s16,
      fontWeight: FontWeight.w600);
}

class FontSizes {
  static double scale = 1.sp;

  static double s11 = 11 * scale;

  static double s12 = 12 * scale;

  static double s14 = 14 * scale;

  static double s16 = 16 * scale;

  static double s18 = 18 * scale;
  static double s20 = 20 * scale;

  static double get s8 => 8 * scale;

  static double get s9 => 9 * scale;

  static double get s10 => 10 * scale;

  static double get s24 => 24 * scale;

  static double get s48 => 48 * scale;

  static double get s13 => 13 * scale;
}

class Styles {
  /// code screens colors
  static const reSendButtonColor = Color(0xff628303);
  static const deleteButtonColor = Color(0xffED3024);

  /// contact dialog gradient

  static const contactDialogGrad1 = Color.fromRGBO(0, 0, 0, 0);
  static const contactDialogGrad2 = Color.fromRGBO(0, 0, 0, 0.32);
  static const contactDialogGrad3 = Color.fromRGBO(0, 0, 0, 0.5);

  ///home

  static const unActiveTabBarIcon = Color.fromRGBO(255, 255, 255, 0.61);
  static const chatWithUnReadMessage = Color(0xffAEE80A);
  static const darkGreen = Color(0xff2F8511);
  static const lastMessageRead = Color(0xff5B5B5B);

  //task TextField Color

  static const taskTextFieldBackGroundColor = Color(0xffE6E6E6);

  /// custom dialig evaluation

  static const double kDialogBorderRadius = 40;

  static const double kDialogTopPadding = 35;
  static const double kDialogPadding = 20;
  static const double kAvatarRadius = 45;
  static const double kBasicButtonRadius = 15;

  /// return Screen
  final RegExp emailValidatorRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  final phoneRegExp = RegExp(r"\(?\d+\)?[-.\s]?\d+[-.\s]?\d+");

  /// App Settings
  static Color get colorPrimary => Color(0xFF82C8D5);

  static Color get secondaryColor => Color(0xFFFFDFA0);

  /// font
  static const FontFamilyBlack = 'Poppins-Black';
  static const FontFamilyBold = 'Poppins-Bold';
  static const FontFamilySemiBold = 'Poppins-SemiBold';
  static const FontFamilyLight = 'Poppins-Light';
  static const FontFamilyPoppinsMedium = 'Poppins-Medium';
  static const FontFamilyMontserrat = 'Montserrat';
  static const FontFamily = 'Montserrat';
  static const FontFamilyMontserratBlack = 'Montserrat_Black';
  static const FontFamilyMontserratMedium = 'Montserrat-Medium';
  static const FontFamilyPoppins = 'Poppins';
  static const FontFamilyMontserratSemiBold = 'Montserrat-SemiBold';

  static double textSizeScaleFactor = 1;

  static double fontSize7 = 7 * textSizeScaleFactor;
  static double fontSize8 = 8 * textSizeScaleFactor;
  static double fontSize10 = 10 * textSizeScaleFactor;
  static double fontSize11 = 11 * textSizeScaleFactor;
  static double fontSize12 = 12 * textSizeScaleFactor;
  static double fontSize13 = 13 * textSizeScaleFactor;
  static double fontSize14 = 14 * textSizeScaleFactor;
  static double fontSize15 = 15 * textSizeScaleFactor;
  static double fontSize16 = 16 * textSizeScaleFactor;
  static double fontSize17 = 17 * textSizeScaleFactor;
  static double fontSize18 = 18 * textSizeScaleFactor;
  static double fontSize20 = 20 * textSizeScaleFactor;
  static double fontSize23 = 23 * textSizeScaleFactor;
  static double fontSize25 = 25 * textSizeScaleFactor;
  static double fontSize30 = 30 * textSizeScaleFactor;
  static double fontSize35 = 35 * textSizeScaleFactor;
  static double fontSize40 = 40 * textSizeScaleFactor;
  static double fontSize88 = 88 * textSizeScaleFactor;

  static double fontSizeCustom(double size) => size * textSizeScaleFactor;

  static const fontColorWhite = Color(0xFFFFFFFF);
  static const FontColorGray = Color(0xFFBCBCBC);
  static const fontColorDarkGray = Color(0xFF686060);
  static const FontColorLiteGray = Color(0xFFCBCFD3);
  static const FontColorDarkGray1 = Color(0xFF9A9A9A);
  static const FontColorLiteGray2 = Color(0xFFDEDEDE);
  static const calendarCell = Color(0xFFEFEFEF);
  static const calendarCellWithBug = Color(0xFFF1FFB5);
  static const badgeCalor = Color(0xFFFb0ec0c);
  static const myTaskCalor = Color(0xFFD2F2A8);

  static const FontColorBlack = Color(0xFF494949);
  static const deadLineColor = Color(0xFF656565);
  static const ColorYellow = Color(0xFFFFDFA0);
  static const ColorDarkYellow = Color(0xFFC0C48A);
  static const FontColorNiagara = Color(0xFF0FB0A2);
  static const FontColorOrange = Color(0xFFE8833B);
  static const FontColorOrangeLite = Color(0xFFFFA337);
  static const FontColorYellow = Color(0xFFEAC170);
  static const FontColorBlueTurquoise = Color(0xFF13A7C8);
  static const black = Color(0xFF000000);

  static TextStyle get fontStyle =>
      TextStyle(fontFamily: Styles.FontFamilyMontserrat);

  static get mediumFontStyle => fontStyle.copyWith(fontWeight: FontWeight.w500);

  static get semiBoldFontStyle =>
      fontStyle.copyWith(fontWeight: FontWeight.w600);

  static TextStyle formInputTextStyle = fontStyle.copyWith(
      fontWeight: FontWeight.w200, fontFamily: Styles.FontFamily);
  static InputDecoration formInputDecoration = InputDecoration(
      border: InputBorder.none, filled: true, fillColor: Colors.white);

  static InputDecoration borderlessRoundedFieldDecoration(
          {double radius = 40}) =>
      formInputDecoration.copyWith(
          border: InputBorder.none,
          focusedBorder: roundedTransparentBorder(radius: radius),
          enabledBorder: roundedTransparentBorder(radius: radius),
          errorBorder: roundedTransparentBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          disabledBorder: roundedTransparentBorder(radius: radius),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white);

  static InputDecoration borderedRoundedFieldDecoration({double radius = 40}) =>
      formInputDecoration.copyWith(
          border: roundedOutlineInputBorder(radius: radius),
          focusedBorder: roundedOutlineInputBorder(radius: radius),
          enabledBorder: roundedOutlineInputBorder(radius: radius),
          errorBorder: roundedOutlineInputBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: roundedOutlineInputBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          disabledBorder: roundedOutlineInputBorder(radius: radius),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white);

  static InputBorder roundedTransparentBorder({double radius = 40}) =>
      OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(radius),
      );

  static InputBorder roundedOutlineInputBorder({double radius = 40}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: Styles.colorPrimary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      );

  static const ColorUpdateDialog = Color.fromRGBO(34, 34, 34, 0.94);
  static const ColorToglleButton = Color.fromRGBO(83, 78, 86, 1);
}

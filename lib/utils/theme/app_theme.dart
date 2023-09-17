import 'package:flutter/material.dart';
import 'package:kooha_test/utils/helpers/color.dart';

enum ThemeType { light, dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.dark;

  late bool isDark;
  late Color background;
  late Color surface;
  late Color bg2;
  late Color primary;
  late Color primaryText;
  late Color secondary;
  late Color secondaryTxt;
  late Color accent;
  late Color grey;
  late Color greyStrong;
  late Color neonGreen;
  late Color greyWeak;
  late Color textFieldBorder;
  late Color error;
  late Color focus;
  late Color primaryButton;

  late Color redButton;
  late Color txt;
  late Color hintText;

  late Color accentTxt;
  late Color glassWhite;
  late Color greyTextFieldFill;
  late Color black;
  late Color transparentBlack;

  late Color blue;
  late Color dividerColor;
  late Color cardColor;
  AppTheme(this.isDark) {
    txt = isDark ? Colors.white : const Color(0xff323B56);
    accentTxt = Colors.white;
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(false)
          ..background = const Color(0xFFE5EDF0)
          ..bg2 = const Color(0xffF6F7FA)
          ..surface = Colors.white
          ..cardColor = const Color(0xffF1F5F6)
          ..dividerColor = const Color(0xffE3E3E3)
          ..hintText = const Color(0xff4D4D4D)
          ..primary = const Color(0xffFF5219)
          ..primaryText = const Color(0xffFFFFFF)
          ..secondary = const Color(0xffF8A80D)
          ..secondaryTxt = const Color(0xff666666)
          ..accent = const Color(0xffB15DFF)
          ..greyWeak = const Color(0xffA8A8A8)
          ..textFieldBorder = const Color(0xff333333)
          ..grey = const Color(0xff666666)
          ..black = Colors.black
          ..transparentBlack = const Color(0xff23262B)
          ..greyStrong = const Color(0xff151918)
          ..neonGreen = const Color(0xff39FF14)
          ..error = Colors.redAccent
          ..redButton = const Color(0xffF97A60)
          ..blue = Colors.blue
          ..primaryButton = const Color(0xff28156C)
          ..glassWhite = const Color(0x5affffff)
          ..greyTextFieldFill = const Color(0xfff141414)
          ..focus = const Color(0xFF0ee2b1);

      default:
        return AppTheme.fromType(defaultTheme);
    }
  }

  ThemeData get themeData {
    ThemeData t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: primaryText,
        secondary: secondary,
        secondaryContainer: ColorHelper.getMaterialColorFromColor(secondaryTxt),
        background: background,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: greyWeak,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      highlightColor: primary,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primary;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primary;
          }
          return null;
        }),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  const MyTheme._internal();

  static const MaterialColor _primary = red;
  // static const MaterialAccentColor _accent = Colors.pinkAccent;
  static const MaterialAccentColor _accent = Colors.redAccent;

  static final ThemeData data = ThemeData(
    primarySwatch: _primary, // 基本の色
    textButtonTheme: TextButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(240, 50),
        primary: red[500],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(),
    primaryTextTheme: const TextTheme().copyWith(
        // headline6: TextStyle().copyWith(
        //   color: Colors.black, // appBarのタイトル
        // ),
        ),
    textTheme: TextThemeCustom.createTextTheme(),
    cupertinoOverrideTheme: CupertinoThemeData(
      // primaryColor: Colors.blue, // cursor ios
      primaryColor: Colors.red, // cursor ios
    ),
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder: OutlineInputBorder( // 四角で囲う
      // borderSide: BorderSide(color: Colors.grey), // 枠線の色
      // ),
      // enabledBorder: UnderlineInputBorder( // 下線
      //   borderSide: BorderSide(color: Colors.grey), // 枠線の色
      // ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.solid, color: Colors.red),
      ),
      // focusColor: Colors.blue,
      fillColor: Colors.orange.shade50,
      // labelStyle: const TextStyle(
      //   color: Colors.blue, // ラベルテキストの色
      // ),
    ),
    iconTheme: const IconThemeData.fallback().copyWith(
      color: _accent,
    ),
    primaryIconTheme: const IconThemeData.fallback().copyWith(
      color: Colors.grey, // 戻る
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _primary,
    ).copyWith(
      onSurface: _primary,
    ),
    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
      color: Colors.red[400],
    )),
  );
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xEEEEEEEE),
    200: const Color(0xDDDDDDDD),
    300: const Color(0xCCCCCCCC),
    400: const Color(0xBBBBBBBB),
    500: const Color(0xAAAAAAAA),
    600: const Color(0x99999999),
    700: const Color(0x88888888),
    800: const Color(0x77777777),
    900: const Color(0x66666666),
  },
);
// ARGB
const MaterialColor red = const MaterialColor(
  0xffd32f2f,
  const <int, Color>{
    50: const Color(0xffffebee),
    100: const Color(0xffffcdd2),
    200: const Color(0xffef9a9a),
    300: const Color(0xffe57373),
    400: const Color(0xffef5350),
    500: const Color(0xfff44336),
    600: const Color(0xffe53935),
    700: const Color(0xffd32f2f),
    800: const Color(0xffc62828),
    900: const Color(0xffb71c1c),
  },
);

class TextThemeCustom {
  TextThemeCustom._();

  static TextTheme createTextTheme() {
    return TextTheme(
      // headline5: TextStyle(
      //   color: ColorThemeCustom.theme["black"],
      //   fontWeight: FontWeight.w400,
      //   fontStyle: FontStyle.normal,
      // ).merge(font_size_18),
      // bodyText1: TextStyle().merge(font_size_18),
      // bodyText2: TextStyle(
      //   color: Color(0x8A1A1512),
      // ).merge(font_normal).merge(font_size_15),
      button: TextStyle(
        color: ColorThemeCustom.theme["white"],
        // fontSize: 20,
      ),
      // headline6: TextStyle(
      //   color: ColorThemeCustom.theme["black"],
      // ).merge(font_medium).merge(font_size_18),
      // subtitle2: TextStyle(
      //   color: ColorThemeCustom.theme["black"],
      // ).merge(font_medium).merge(font_size_16),
    );
  }

  static const TextStyle font_normal = const TextStyle(
    fontSize: 16.0,
    fontFamily: 'NotoSansCJKjp',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle font_medium = const TextStyle(
    fontSize: 16.0,
    fontFamily: 'NotoSansCJKjp',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle font_bold = const TextStyle(
    fontSize: 16.0,
    fontFamily: 'NotoSansCJKjp',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle font_size_15 = const TextStyle(fontSize: 15.0);
  static const TextStyle font_size_16 = const TextStyle(fontSize: 16.0);
  static const TextStyle font_size_17 = const TextStyle(fontSize: 17.0);
  static const TextStyle font_size_18 = const TextStyle(fontSize: 18.0);
  static const TextStyle font_size_22 = const TextStyle(fontSize: 22.0);
  static const TextStyle font_size_40 = const TextStyle(fontSize: 40.0);

  static const TextStyle font_color_primary =
      const TextStyle(color: ColorThemeCustom.customPrimaryColor);
}

class ColorThemeCustom {
  ColorThemeCustom._();

  static const int customPrimaryValue = 0xFFF5A076;
  static const Color customPrimaryColor = const Color(customPrimaryValue);
  static const MaterialColor customSwatch =
      const MaterialColor(customPrimaryValue, const <int, Color>{
    50: const Color(0xFFFFDDC1),
    100: const Color(0xFFFFD3B7),
    200: const Color(0xFFFFC9AE),
    300: const Color(0xFFFFBFA4),
    400: const Color(0xFFFFB59B),
    500: const Color(0xFFFFAB91),
    600: const Color(0xFFF29F86),
    700: const Color(0xFFE4937A),
    800: const Color(0xFFD7876F),
    900: const Color(0xFFC97B63),
  });
  static const Map<String, Color> theme = const <String, Color>{
    "white": const Color(0xFFFFFFFF),
    "black": const Color(0xdd000000),
  };
}

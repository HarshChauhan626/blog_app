import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // static Color primaryColor=Color(0xff449183);

  static Color primaryColor = Color(0xff023047);

  // static Color primaryColor=Color(0xff8d8cf5);
  //
  // static Color primaryColor=Color(0xff586fdb);

  static const int _darkBluePrimaryValue = 0xFF1e2944;

  // static const int _darkBluePrimaryValue=0xff8d8cf5;

  static Color lightBlueColor=Color(0xfff8f5fe);

  static final greyColor=Colors.grey[400];

  // static final appGreyColor=Color(0xffd9dde3);

  static final darkPinkColor=Color(0xff596b98);

  static final lightPinkColor=Color(0xffb4cafe);

  static final appGreyColor=Color(0xfff2f2f2);

  static const MaterialColor darkBlue = MaterialColor(
    _darkBluePrimaryValue,
    <int, Color>{
      100: Color(0xFF787f8f),
      200: Color(0xFF62697c),
      300: Color(0xFF4b5469),
      400: Color(0xFF353e57),
      500: Color(_darkBluePrimaryValue),
      600: Color(0xFF1b253d),
      700: Color(0xFF182136),
      800: Color(0xFF151d30),
      900: Color(0xFF121929),
    },
  );
}

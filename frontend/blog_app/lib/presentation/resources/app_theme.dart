import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24.0, letterSpacing: 0,fontWeight: FontWeight.w900)
        ),
        textTheme: const TextTheme(
          headline4: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 34.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.25),
          headline5:
              TextStyle(color: Colors.black, fontSize: 24.0, letterSpacing: 0),
          headline6: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15),
          subtitle1:
              TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 0.15),
          subtitle2: TextStyle(
              color: Colors.black,
              fontSize: 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500),
          bodyText1:
              TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 0.5),
          bodyText2:
              TextStyle(color: Colors.black, fontSize: 14, letterSpacing: 0.25),
          button: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 1.25,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primaryColor,
        // accentColor: Colors.black,
        splashColor: Colors.transparent,
        // Used this for changing active prefix icon color in textfield
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primaryColor
        ),
        fontFamily: 'IBM',
        inputDecorationTheme: const InputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
                primary: AppColors.primaryColor,
                minimumSize: const Size(50.0, 30.0),
                )));
  }
}

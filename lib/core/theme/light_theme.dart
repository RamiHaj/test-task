import 'package:flutter/material.dart';
import 'package:test_task/core/constants/colors.dart';

class AppTheme
{
  static ThemeData lightTheme = ThemeData(
    primaryColor: CustomColors.amber,
    shadowColor: Colors.black45,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: CustomColors.black),
      shadowColor: Colors.black45,
      elevation: 3,
      iconTheme: IconThemeData(color: CustomColors.black),
      backgroundColor: CustomColors.amber,
      foregroundColor: CustomColors.black,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: CustomColors.black,fontWeight: FontWeight.normal),
      bodyText2: TextStyle(color: CustomColors.black,fontWeight: FontWeight.normal),
      headline6: TextStyle(color: CustomColors.black,fontSize: 20,fontWeight: FontWeight.w600),
    ),
  );
}
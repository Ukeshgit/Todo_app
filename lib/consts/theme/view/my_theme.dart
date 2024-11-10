import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/consts/colors.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primarySwatch: Colors.deepPurple,
    useMaterial3: true,
    scaffoldBackgroundColor: Appcolors.lightBgColor,
    //appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
      titleTextStyle: TextStyle(
          fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light(
        background: Appcolors.lightBgColor, //for scaffold background
        onBackground: Appcolors.lightTextColor, //for text color
        primary: Colors.deepPurple, //for appbar background
        onPrimary: Colors.black, //for appbar text color
        surface: Appcolors.lightDivColor, //for card background color
        onSurface: Appcolors.lightTextColor, //for card text color
        secondary: Appcolors.buttonColor, //for button background color
        onSecondary: Appcolors.lightColor, //for button text color
        onError: Colors.red, //for error text color
        error: Appcolors.lightDivColor, //for error background color
        primaryContainer:
            Appcolors.lightDivColor, //for container background color
        secondaryContainer:
            Appcolors.lightDivColor, //for container background color
        onPrimaryContainer: Appcolors.lightTextColor, //for container textcolor
        onSecondaryContainer:
            Appcolors.lightTextColor)); //for container text color

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // primarySwatch: Colors.deepOrange,
    useMaterial3: true,
    scaffoldBackgroundColor: Appcolors.darkBgColor,
    // //appbar theme
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[800],
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true),
    colorScheme: const ColorScheme.dark(
        background: Appcolors.darkBgColor,
        onBackground: Appcolors.darkTextColor,
        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        surface: Appcolors.darkDivColor,
        onSurface: Appcolors.darkTextColor,
        secondary: Appcolors.buttonColor,
        onSecondary: Appcolors.darkColor,
        onError: Colors.red,
        error: Appcolors.darkDivColor,
        primaryContainer: Appcolors.darkDivColor,
        secondaryContainer: Appcolors.darkDivColor,
        onPrimaryContainer: Appcolors.darkTextColor,
        onSecondaryContainer: Appcolors.darkTextColor));

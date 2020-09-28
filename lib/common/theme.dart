import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF1E3F5A),
      primaryColorLight: const Color(0xFF497398),
      primaryColorDark: const Color(0xFF092B42),
      primaryColorBrightness: Brightness.dark,
      accentColor: const Color(0xFFB00D25),
      bottomAppBarColor: Colors.white,

      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: Theme.of(context)
          .textTheme
          .apply(bodyColor: Colors.black, displayColor: Colors.black),
    );
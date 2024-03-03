import 'package:flutter/material.dart';

const Color dark = Color.fromARGB(255, 21, 21, 21);
const Color white = Color.fromARGB(255, 255, 255, 255);
const Color primary = Color.fromARGB(255, 243, 167, 68);

final ThemeData themeDark = ThemeData(
  scaffoldBackgroundColor: dark,
  primarySwatch: Colors.orange,
  colorScheme: ColorScheme.fromSeed(seedColor: primary),
  appBarTheme: const AppBarTheme(
    backgroundColor: dark,
    foregroundColor: white,
    titleTextStyle: TextStyle(
      color: white,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: white),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: white,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    ),
    bodyLarge: TextStyle(
      color: white,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Color.fromARGB(255, 48, 48, 48),
    thickness: 1,
    space: 10,
    indent: 10,
    endIndent: 10,
  ),
  listTileTheme: const ListTileThemeData(iconColor: white),
  useMaterial3: true,
);

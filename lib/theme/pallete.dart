import 'package:flutter/material.dart';

class Pallete {
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var greenColor = const Color.fromRGBO(62, 139, 58, 1);
  static var textColor = const Color.fromRGBO(60, 60, 60, 1);
  static var cardColor =const Color.fromRGBO(244, 244, 244, 1);
  static var cameraCardColor = const Color.fromRGBO(64, 64, 64, 1);

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: greenColor,
    backgroundColor: whiteColor,
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JezreelColors{
  static final yellow = Colors.yellow;
  static final white = Colors.white;
  static final darkGrey = Color.fromRGBO(35, 36, 40, 1);
  static final blue = Color.fromRGBO(43, 53, 79, 1);
  static final black = Color.fromRGBO(33, 33, 33, 1);
  static final greyAccent = Color.fromRGBO(145, 145, 150, 1);
  static final green = Color.fromRGBO(3, 167, 80, 1);
}


final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    brightness:Brightness.light,
    color: JezreelColors.darkGrey,
  ),
  
  primaryColor: JezreelColors.white,
  accentColor: JezreelColors.green,
  primaryColorDark: JezreelColors.greyAccent,


  textTheme: GoogleFonts.varelaRoundTextTheme().apply(
    bodyColor: JezreelColors.black,
    displayColor: JezreelColors.black,
  ),
  // primaryTextTheme:GoogleFonts.openSansTextTheme().apply(
  //   bodyColor: JezreelColors.yellow,
  //   displayColor: JezreelColors.yellow,
    
  // ) ,
  accentTextTheme: GoogleFonts.varelaRoundTextTheme().apply(
    bodyColor: JezreelColors.greyAccent,
    displayColor: JezreelColors.greyAccent,
  ),
  primaryTextTheme: GoogleFonts.varelaRoundTextTheme().apply(
    bodyColor: JezreelColors.white,
    displayColor: JezreelColors.white,
  ),
  iconTheme: IconThemeData().copyWith(
    color: JezreelColors.black,
    size:20,
  ),
  
  
 
);

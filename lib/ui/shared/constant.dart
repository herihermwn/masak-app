import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//? -----------------
/// [Constant Color]
//? -----------------
Color get whiteColor => Colors.white;
Color get darkTextColor => Color(0xFF747474);
Color get inputBackgroundColor => Color(0xFFEEEEEE);
Color get scaffoldBackgroundColor => Color(0xFFF8F8F8);
Color get yellowColor => Color(0xFFFFC700);
Color get purpleColor => Color(0xFF503E9D);
Color get greenColor => Color(0xFF11AC6A);

//? ----------------------
/// [Constant ThemeData]
//? ----------------------
ThemeData get lightTheme => ThemeData(
      primaryColor: greenColor,
      accentColor: yellowColor,
      brightness: Brightness.light,
      cardColor: whiteColor,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.black87
      ),
    );

ThemeData get darkTheme => ThemeData(
      primaryColor: purpleColor,
      accentColor: yellowColor,
      brightness: Brightness.dark,
      cardColor: Colors.black87,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: whiteColor,
      ),
    );
    
//? -------------------
/// [Constant Shadow]
//? -------------------
List<BoxShadow> get boxShadowBottom => [
      BoxShadow(
        color: Color(0xff747474).withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 8,
        offset: Offset(2, 4), // changes position of shadow
      ),
    ];

List<BoxShadow> get boxShadowAbove => [
      BoxShadow(
        color: Color(0xff747474).withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 8,
        offset: Offset(-2, -4), // changes position of shadow
      ),
    ];

//? -------------------
/// [Assets Location]
//? -------------------
String svgAsset = "assets/icons";
String imageAsset = "assets/images";

//? ------------------
/// [Constant AppBar]
//? ------------------
PreferredSize get noAppBar => PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
    );

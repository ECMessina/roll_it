import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final Color backgroundColor = Colors.green.shade100;
  static final Color darkerGradientColor = Colors.green;
  static final Color borderColor = Colors.black;
  static final Color focusedColor = Color.fromARGB(255, 240, 223, 70);
  static final Color buttonShadowColor = Colors.green.shade900;
}

class AppTextStyles {
  static final TextStyle appBarTextStyle = GoogleFonts.darumadropOne(
    fontSize: 30,
  );

  static final TextStyle buttonTextStyle = GoogleFonts.darumadropOne(
    color: Colors.black,
    fontSize: 30,
  );
}

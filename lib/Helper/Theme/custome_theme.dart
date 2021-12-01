import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      backgroundColor: AppColors.movBackGround,
      scaffoldBackgroundColor: AppColors.movBackGround,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.movBackGround,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          side: BorderSide(
            width: .1,
            color: AppColors.whiteColor,
          ),
          shadowColor: AppColors.pinkColor.withOpacity(.3),
          primary: AppColors.whiteColor,
        ),
      ),
    );
  }
}

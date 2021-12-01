import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';

class AppTheme {
// * status Mode
  static bool getTheme({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // * headline5
  static TextStyle? h5({required BuildContext context}) {
    return Theme.of(context).textTheme.headline5;
  }

  static TextStyle? h25({required BuildContext context}) {
    return Theme.of(context).textTheme.headline5?.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: !AppTheme.getTheme(context: context)
              ? AppColors.whiteColor
              : AppColors.blackColor,
        );
  }

  // * headline6
  static TextStyle? h6({required BuildContext context}) {
    return Theme.of(context).textTheme.headline6;
  }

  // * headline6s
  static TextStyle? h20({required BuildContext context}) {
    return Theme.of(context).textTheme.headline6?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: !AppTheme.getTheme(context: context)
              ? AppColors.whiteColor
              : AppColors.blackColor,
        );
  }

  // * headline6s
  static TextStyle? h16({required BuildContext context}) {
    return Theme.of(context).textTheme.headline6?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: !AppTheme.getTheme(context: context)
              ? AppColors.whiteColor
              : AppColors.blackColor,
        );
  }

  // * bodyText1
  static TextStyle? b1({required BuildContext context}) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          color: !AppTheme.getTheme(context: context)
              ? AppColors.greyLight
              : AppColors.movLight,
        );
  }

  // * bodyText2
  static TextStyle? b2({required BuildContext context}) {
    return Theme.of(context).textTheme.bodyText2?.copyWith(
          color: AppTheme.getTheme(context: context)
              ? AppColors.blackColor
              : AppColors.movLight,
        );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(title, message,
        backgroundColor: backgroundColor,
        titleText: Text(
          title,
          style: AppTheme.h20(context: context!),
        ),
        messageText: Text(
          message,
          style: AppTheme.h16(context: context),
        ),
        colorText: AppColors.whiteColor,
        borderRadius: 8,
        margin: EdgeInsets.all(16.w));
  }
}

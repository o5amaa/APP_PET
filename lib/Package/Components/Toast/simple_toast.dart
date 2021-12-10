import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> simpleToast(
    {required String message, Color? backgroundColor}) async {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    backgroundColor: backgroundColor ?? AppColors.blueColor,
    textColor: Colors.white,
    fontSize: 16.sp,
    timeInSecForIosWeb: 1,
  );
}

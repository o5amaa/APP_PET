import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

Future<void> simpleToast({required String message}) async {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    backgroundColor: AppColors.btnBackGround,
    textColor: Colors.white,
    fontSize: 16.sp,
    timeInSecForIosWeb: 1,
  );
}

Future<void> simpleSnacBar(
    {required String title, required String message}) async {
  await Get.snackbar(
    title,
    message,
    animationDuration: const Duration(milliseconds: 5000),
  );
}

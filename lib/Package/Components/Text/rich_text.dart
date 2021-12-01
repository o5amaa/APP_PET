import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RichTextAuth extends StatelessWidget {
  const RichTextAuth({
    Key? key,
    required String fWord,
    required String sWord,
    required Function() onTap,
  })  : _fWord = fWord,
        _sWord = sWord,
        _onTap = onTap,
        super(key: key)
  //
  ;

  final String _fWord;
  final String _sWord;
  final Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _fWord.tr,
            style: AppTheme.b1(context: context)?.copyWith(
              color: !AppTheme.getTheme(context: context)
                  ? AppColors.greyLight
                  : AppColors.blackColor,
            ),
          ),
          TextSpan(
            text: _sWord.tr,
            style: AppTheme.b1(context: context)?.copyWith(
              color: !AppTheme.getTheme(context: context)
                  ? AppColors.movcolorLight
                  : AppColors.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTap,
          ),
        ],
      ),
    );
  }
}

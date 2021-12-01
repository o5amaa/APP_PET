import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SimpleBtn extends StatelessWidget {
  const SimpleBtn({
    Key? key,
    void Function()? onTap,
    required String btnText,
    TextStyle? textStyle,
    double? sizeWidth,
    double? sizeHeight,
    List<Color>? backColor,
  })  : _onTap = onTap,
        _btnText = btnText,
        _textStyle = textStyle,
        _sizeWidth = sizeWidth,
        _sizeHeight = sizeHeight,
        _backColor = backColor,
        //
        super(key: key);

  final void Function()? _onTap;
  final String _btnText;
  final TextStyle? _textStyle;
  final double? _sizeWidth, _sizeHeight;
  final List<Color>? _backColor;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: _onTap,
        child: Container(
          width: _sizeWidth ?? _size.width,
          height: _sizeHeight ?? 60.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _backColor ?? AppColors.btnColor,
              begin: Alignment.bottomCenter,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            _btnText.tr,
            style: _textStyle ??
                AppTheme.h6(context: context)?.copyWith(
                  color: !AppTheme.getTheme(context: context)
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                ),
          ),
        ),
      ),
    );
  }
}

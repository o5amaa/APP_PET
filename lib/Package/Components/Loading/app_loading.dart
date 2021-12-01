import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'enum_loading.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key, required ChooseLoading type, double size = 45})
      : _chooseLoading = type,
        _size = size,
        super(key: key);

  final ChooseLoading _chooseLoading;
  final double _size;

  @override
  Widget build(BuildContext context) {
    bool _isDark = AppTheme.getTheme(context: context);
    Color colorLoading =
        _isDark ? AppColors.darkLoading : AppColors.lightLoading;

    switch (_chooseLoading) {
      case ChooseLoading.PROFILE:
        return SpinKitSquareCircle(color: colorLoading, size: _size.sp);

      case ChooseLoading.IMAGE:
        return SpinKitFadingCircle(color: colorLoading, size: _size.sp);
      case ChooseLoading.PAGE:
        return SpinKitPulse(color: colorLoading, size: _size.sp);

      case ChooseLoading.WEBPAGE:
        return SpinKitWanderingCubes(color: colorLoading, size: _size.sp);
      case ChooseLoading.BUTTON:
        return SpinKitFadingCircle(
            itemBuilder: (_, __) {
              // itemBuilder: (context,index) {
              //* the same Continer()
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: AppColors.waitDataColors), //*color
                  shape: BoxShape.circle,
                ),
              );
            },
            size: _size.sp);

      default:
        return SpinKitFadingCircle(color: colorLoading, size: _size.sp);
    }
  }
}

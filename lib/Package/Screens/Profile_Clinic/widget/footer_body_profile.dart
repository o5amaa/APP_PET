import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterBodyProfileWidget extends StatelessWidget {
  const FooterBodyProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      constraints: BoxConstraints.expand(
        width: double.infinity.w,
        height: 130.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                Icons.language,
                color: AppColors.movLight,
              ),
              Text(
                'Language',
                style: AppTheme.b2(context: context),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                color: AppColors.movLight,
              ),
              Text(
                'Share',
                style: AppTheme.b2(context: context),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.check_rounded,
                color: AppColors.movLight,
              ),
              Text(
                'Speciali Offers',
                style: AppTheme.b2(context: context),
              )
            ],
          ),
        ],
      ),
    );
  }
}

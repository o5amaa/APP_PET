import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Package/Components/Btn/custom_btn.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyBodyProfileWidget extends StatelessWidget {
  const BodyBodyProfileWidget({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jeddah,KSA',
                style: AppTheme.b1(context: context),
              ),
              Text(
                'Email',
                style: AppTheme.b1(context: context),
              ),
            ],
          ),
          const Spacer(),
          CustomBtn(
            btnText: 'Edit',
            sizeWidth: _size.width.w * .3 - 30,
            sizeHeight: 60.h,
            backColor: [AppColors.movLight, AppColors.movBackGround],
            onTap: () {
              debugPrint('Click Edit');
            },
          )
        ],
      ),
    );
  }
}

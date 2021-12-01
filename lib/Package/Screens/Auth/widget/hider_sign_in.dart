import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Package/Components/Btn/simple_btn.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:get/get.dart';

class HiderSignInWidget extends StatelessWidget {
  const HiderSignInWidget({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SimpleBtn(
          btnText: 'CLINIC SIGN IN',
          sizeWidth: _size.width * .4,
          textStyle: AppTheme.h16(context: context),
          backColor: [
            AppColors.movcolorLight,
            AppColors.pinkColor,
          // ignore: todo
          ], //TODO :: 00
        ),
        // const SizedBox(width: 20),
        const Spacer(),
        SimpleBtn(
          btnText: 'CLINIC SIGN UP',
          sizeWidth: _size.width * .4,
          textStyle: AppTheme.h16(context: context)
              ?.copyWith(color: AppColors.greyLight),
          // backColor: [AppColors.pinkColor, AppColors.movBackGround],
          backColor: AppColors.btnWithoutColor,
          onTap: () {
            Get.back();
          },
        ),
      ],
    );
  }
}

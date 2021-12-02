import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Helper/Utils/path_images.dart';
import 'package:flutter_pet/Package/Components/Btn/custom_btn.dart';
import 'package:flutter_pet/Package/Components/Loading/app_loading.dart';
import 'package:flutter_pet/Package/Components/Loading/enum_loading.dart';
import 'package:flutter_pet/Package/Components/Text_Filed/simple_filed.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/forgot_controller.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_pet/Services/Validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageForgot extends StatelessWidget {
  static const String id = '/PageForgot';
  const PageForgot({Key? key}) : super(key: key);

  static final ForgotController _forgotController =
      Get.find<ForgotController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              'Forgot Password',
              style: AppTheme.h16(context: context),
            ),
            Divider(
              color: AppColors.whiteColor,
              height: 12.h,
              thickness: 3,
              endIndent: 120.w,
              indent: 120.w,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              // color: AppColors.whiteColor,//
              width: _size.width.w,
              height: _size.height.w * .4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(PathImage.imgForgot),
                  fit: BoxFit.cover,
                ),
                // borderRadius: BorderRadius.all(Radius.circular(14.r)),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'enter your email address and we will email you instructions on how  to reset password. ',
              style: AppTheme.h16(context: context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: _forgotController.keyForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SimpleFiled(
                      hint: 'Email',
                      style: AppTheme.h16(context: context)?.copyWith(
                          color: AppTheme.getTheme(context: context)
                              ? AppColors.movcolorLight
                              : AppColors.whiteColor),
                      pIcon: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: PathIcons.emailIcon,
                      ),
                      keybordType: TextInputType.emailAddress,
                      onValidator: (value) {
                        debugPrint('onValidator :' + value.toString());
                        return AppValidators.isEmail(value);
                      },
                      onSaved: (value) =>
                          _forgotController.email.value = value!,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: _forgotController.isLodeng.value
                            ? const AppLoading(type: ChooseLoading.BUTTON)
                            : CustomBtn(
                                sizeHeight: 85.h,
                                btnText: 'SIND',
                                textStyle: AppTheme.h20(context: context)
                                    ?.copyWith(color: AppColors.movBackGround),
                                // backColor: AppColors.btnColorBottom,
                                backColor: [
                                  AppColors.whiteColor,
                                  AppColors.movLight
                                ],
                                onTap: () {
                                  debugPrint('SEND');
                                  _forgotController.chackInput();
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}

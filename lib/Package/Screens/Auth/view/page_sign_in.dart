import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Components/Btn/custom_btn.dart';
import 'package:flutter_pet/Package/Components/Text/rich_text.dart';
import 'package:flutter_pet/Package/Components/Text_Filed/simple_filed.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/sign_in_controller.dart';
import 'package:flutter_pet/Package/Screens/Auth/widget/hider_sign_in.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_pet/Services/Validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageSignIn extends StatelessWidget {
  static const String id = '/PageSignIn';
  const PageSignIn({Key? key}) : super(key: key);

  static final SignInController _signInController =
      Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.movBackGround),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 30.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
          width: _size.width.w,
          child: Form(
            key: _signInController.keyForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                // ** Hider
                HiderSignInWidget(size: _size),
                // * Boody
                SizedBox(height: 55.h),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleFiled(
                          hint: 'Email',
                          style: AppTheme.h16(context: context)?.copyWith(
                              color: !AppTheme.getTheme(context: context)
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
                          // onSaved: (value) => controller.type.value = value!,
                        ),
                        SizedBox(height: 25.h),
                        SimpleFiled(
                          hint: 'Password',
                          isObscurText: _signInController.obscurText.value,
                          style: AppTheme.h16(context: context)?.copyWith(
                              color: !AppTheme.getTheme(context: context)
                                  ? AppColors.movcolorLight
                                  : AppColors.whiteColor),
                          pIcon: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: PathIcons.passIcon,
                          ),
                          sIcon: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: _signInController.iconSuffix,
                          ),
                          onSIcon: () => _signInController.viewPass(),
                          onValidator: (value) => AppValidators.isPass(value),
                          // onController: controller.password.value,
                          // onSaved: (value) =>
                          //     controller.password.value = value!,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
                // * Forget Pass ..
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Passwored?",
                      style: AppTheme.b1(context: context)?.copyWith(
                        decoration: TextDecoration.underline,
                        color: !AppTheme.getTheme(context: context)
                            ? AppColors.movBackGround
                            : AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: CustomBtn(
                    sizeHeight: 85.h,
                    btnText: 'Sign Up',
                    textStyle: AppTheme.h20(context: context)
                        ?.copyWith(color: AppColors.whiteColor),
                    // backColor: AppColors.btnColorBottom,
                    backColor: [AppColors.movcolorLight, AppColors.whiteColor],
                    onTap: () {
                      debugPrint('Sign Up');
                      _signInController.chackInput();
                    },
                  ),
                ),
                //
                // * Footer ..
                RichTextAuth(
                  fWord: 'Dont Hanv an Account? ',
                  sWord: 'Register',
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

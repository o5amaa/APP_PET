import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Components/Btn/custom_btn.dart';
import 'package:flutter_pet/Package/Components/Loading/app_loading.dart';
import 'package:flutter_pet/Package/Components/Loading/enum_loading.dart';
import 'package:flutter_pet/Package/Components/Text_Filed/simple_filed.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/sign_up_controller.dart';
import 'package:flutter_pet/Package/Screens/Auth/widget/hider_sign_up.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_pet/Services/Validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageSignUp extends StatelessWidget {
  static const String id = '/PageSignUp';
  const PageSignUp({Key? key}) : super(key: key);

  // ignore: unused_field
  static final SignUpController _signUpController =
      Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 30.h),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
            width: _size.width.w,
            child: Form(
              key: _signUpController.keyForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  HiderSignUpWidget(size: _size),
                  // * Boody
                  SizedBox(height: 25.h),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SimpleFiled(
                            hint: 'Enter name',
                            pIcon: Padding(
                              padding: EdgeInsets.all(12.h),
                              child: PathIcons.name,
                            ),
                            keybordType: TextInputType.name,
                            onValidator: (value) {
                              debugPrint('onValidator :' + value.toString());
                              return AppValidators.isEmpty(value);
                            },
                            onSaved: (value) =>
                                _signUpController.dataRegister.addAll(
                              {KeyFirebase.userNmae: value},
                            ),
                          ),
                          SizedBox(height: 15.h),
                          SimpleFiled(
                            hint: 'Email',
                            pIcon: Padding(
                              padding: EdgeInsets.all(12.h),
                              child: PathIcons.emailIcon,
                            ),
                            keybordType: TextInputType.emailAddress,
                            onValidator: (value) {
                              debugPrint('onValidator :' + value.toString());
                              return AppValidators.isEmail(value);
                            },
                            onSaved: (value) => _signUpController.dataRegister
                                .addAll({KeyFirebase.email: value}),
                          ),
                          SizedBox(height: 15.h),
                          SimpleFiled(
                            hint: 'Password',
                            isObscurText: _signUpController.obscurText.value,
                            pIcon: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: PathIcons.passIcon,
                            ),
                            sIcon: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: _signUpController.iconSuffix,
                            ),
                            onSIcon: () => _signUpController.viewPass(),
                            onValidator: (value) => AppValidators.isPass(value),
                            // onController: controller.password.value,
                            onSaved: (value) => _signUpController.dataRegister
                                .addAll({KeyFirebase.pass: value}),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Disription',
                            style: AppTheme.h25(context: context),
                          ),
                          SizedBox(height: 13.h),
                          SimpleFiled(
                            hint: 'Location',
                            pIcon: Padding(
                              padding: EdgeInsets.all(12.h),
                              child: PathIcons.location,
                            ),
                            keybordType: TextInputType.text,
                            onValidator: (value) {
                              debugPrint('onValidator :' + value.toString());
                              return AppValidators.isEmpty(value);
                            },
                            onSaved: (value) => _signUpController.dataRegister
                                .addAll({KeyFirebase.location: value}),
                          ),
                          SizedBox(height: 20.h),
                          SimpleFiled(
                            hint: 'Working Hours',
                            pIcon: Padding(
                              padding: EdgeInsets.all(12.h),
                              child: PathIcons.clock,
                            ),
                            keybordType: TextInputType.text,
                            onValidator: (value) {
                              debugPrint('onValidator :' + value.toString());
                              // ignore: todo
                              return AppValidators.isEmpty(value); //TODO::
                            },
                            onSaved: (value) => _signUpController.dataRegister
                                .addAll({KeyFirebase.workingHours: value}),
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 30.h),
                  Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 60.h),
                      child: _signUpController.isLodeng.value
                          ? const AppLoading(type: ChooseLoading.BUTTON)
                          : CustomBtn(
                              sizeHeight: 85.h,
                              btnText: 'Sign Up',
                              textStyle: AppTheme.h20(context: context)
                                  ?.copyWith(color: AppColors.movBackGround),
                              backColor: AppColors.btnColorBottom,
                              onTap: () {
                                debugPrint('Sign Up');
                                _signUpController.chackInput();
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// class HiderSignInWidget extends StatelessWidget {
//   const HiderSignInWidget({
//     Key? key,
//     required Size size,
//   })  : _size = size,
//         super(key: key);

//   final Size _size;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SimpleBtn(
//           btnText: 'CLINIC SIGN IN',
//           sizeWidth: _size.width.w * .4,
//           textStyle: AppTheme.h16(context: context),
//           backColor: AppColors.btnWithoutColor,
//         ),
//         // const SizedBox(width: 20),
//         const Spacer(),
//         SimpleBtn(
//           btnText: 'CLINIC SIGN UP',
//           sizeWidth: _size.width.w * .4,
//           textStyle: AppTheme.h16(context: context),
//           backColor: [AppColors.pinkColor, AppColors.movBackGround],
//         ),
//       ],
//     );
//   }
// }

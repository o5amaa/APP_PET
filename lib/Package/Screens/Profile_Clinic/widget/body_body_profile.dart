import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Components/Btn/custom_btn.dart';
import 'package:flutter_pet/Package/Components/Loading/app_loading.dart';
import 'package:flutter_pet/Package/Components/Loading/enum_loading.dart';
import 'package:flutter_pet/Package/Components/Text_Filed/simple_filed.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/core/clinic_profile_controller.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/widget/user_ifo/alerte_dialog.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/widget/user_ifo/info_image.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_pet/Services/Validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyBodyProfileWidget extends StatelessWidget {
  const BodyBodyProfileWidget({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return GetX<ClinicProfileController>(
      init: Get.find<ClinicProfileController>(),
      builder: (controller) => controller.getUserMap!.isEmpty ||
              controller.getUserMap == null
          ? const AppLoading(type: ChooseLoading.PAGE)
          : Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.getUserMap?[KeyFirebase.location] ?? '',
                        style: AppTheme.b1(context: context),
                      ),
                      Text(
                        controller.getUserMap?[KeyFirebase.email] ?? '',
                        style: AppTheme.b1(context: context),
                      ),
                    ],
                  ),
                  // ),
                  const Spacer(),
                  CustomBtn(
                    btnText: 'Edit',
                    sizeWidth: _size.width.h * .3 - 10,
                    sizeHeight: 60.h,
                    backColor: [AppColors.movLight, AppColors.movBackGround],
                    onTap: () {
                      debugPrint('Click Edit');
                      Get.bottomSheet(
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 25.w),
                          // width: _size.width.w,
                          height: _size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.movcolorLight,
                                AppColors.movLight
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: controller.keyForm,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // *  ***** hider -- Img
                                  Center(
                                    child: InfoImage(
                                      onPressed: () {
                                        debugPrint('object');
                                        Get.defaultDialog(
                                          backgroundColor:
                                              AppColors.movBackGround,
                                          title: 'Selecte Image',
                                          titleStyle:
                                              AppTheme.h20(context: context),
                                          onCancel: () {},
                                          cancelTextColor: AppColors.whiteColor,
                                          titlePadding:
                                              EdgeInsets.only(top: 20.h),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 10.h),
                                          barrierDismissible: false,
                                          // & ***** Alerte **********
                                          content: AlerteDialogWidget(
                                              size: _size,
                                              profileController: controller),
                                        );
                                      },
                                    ),
                                  ),
                                  // ** body **
                                  SizedBox(height: 10.h),
                                  SimpleFiled(
                                    hint: 'Enter name',
                                    initValue: controller
                                        .getUserMap?[KeyFirebase.userNmae],
                                    pIcon: Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: PathIcons.name,
                                    ),
                                    keybordType: TextInputType.name,
                                    onValidator: (value) {
                                      debugPrint(
                                          'onValidator :' + value.toString());
                                      return AppValidators.isEmpty(value);
                                    },
                                    onSaved: (value) =>
                                        controller.modelUser.fullName = value,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Disription',
                                    style: AppTheme.h20(context: context),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 15.h),
                                  SimpleFiled(
                                      hint: 'Location',
                                      initValue: controller
                                          .getUserMap?[KeyFirebase.location],
                                      pIcon: Padding(
                                        padding: EdgeInsets.all(12.h),
                                        child: PathIcons.location,
                                      ),
                                      keybordType: TextInputType.text,
                                      onValidator: (value) {
                                        debugPrint(
                                            'onValidator :' + value.toString());
                                        return AppValidators.isEmpty(value);
                                      },
                                      onSaved: (value) => controller
                                          .modelUser.location = value),
                                  SizedBox(height: 15.h),
                                  SimpleFiled(
                                    hint: 'Working Hours',
                                    initValue: controller
                                        .getUserMap?[KeyFirebase.workingHours],
                                    pIcon: Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: PathIcons.clock,
                                    ),
                                    keybordType: TextInputType.text,
                                    onValidator: (value) {
                                      debugPrint(
                                          'onValidator :' + value.toString());
                                      return AppValidators.isEmpty(value);
                                    },
                                    onSaved: (value) => controller
                                        .modelUser.workingHours = value,
                                  ),
                                  SizedBox(height: 15.h),
                                  // *  *** Fotter ---
                                  Obx(
                                    () => Center(
                                      child: controller.isLodeng.value
                                          ? const AppLoading(
                                              type: ChooseLoading.BUTTON)
                                          : CustomBtn(
                                              btnText: 'SAVA',
                                              backColor: [
                                                AppColors.movBackGround,
                                                AppColors.movBackGround,
                                              ],
                                              sizeHeight: 50,
                                              sizeWidth: _size.width.w * .5,
                                              onTap: () {
                                                var _i = controller.image;
                                                debugPrint('*** *Sava* ** $_i');
                                                controller.chackInput();
                                              },
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // backgroundColor: AppColors.btnBackGround,
                        // shape: ShapeBorder., b, t),
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}

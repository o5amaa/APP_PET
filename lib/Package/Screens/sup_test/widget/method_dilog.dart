import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Package/Components/Loading/app_loading.dart';
import 'package:flutter_pet/Package/Components/Loading/enum_loading.dart';
import 'package:flutter_pet/Services/Validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Components/Btn/custom_btn.dart';
import 'package:flutter_pet/Package/Components/Text_Filed/simple_filed.dart';
import 'package:flutter_pet/Package/Screens/sup_test/controller/sup_controller.dart';
import 'package:flutter_pet/Package/Screens/sup_test/widget/enum_bottomshet.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';

class CustomDilogMethod {
  // ChooseBotomSheet? chooseBotomSheet;

  // CustomDilogMethod({
  //   this.chooseBotomSheet,
  // });

  static Future<dynamic> buildBottmSheetMethod({
    ChooseBotomSheet chooseBotomSheet = ChooseBotomSheet.add,
    required SupController supController,
    required BuildContext context,
    required Size size,
    String? docId,
  }) {
    return Get.bottomSheet(
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
            child: Form(
              key: supController.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //? *======= Title BottomSheet =======*/
                  Text(
                    chooseBotomSheet == ChooseBotomSheet.add
                        ? 'Add new'
                        : 'Edit',
                    style: AppTheme.h20(context: context),
                  ),
                  SizedBox(height: 10.h),

                  //^ *------- Employe -------*/
                  SimpleFiled(
                    cursorColor: AppColors.whiteColor,
                    hint: 'Employe',
                    //todo  TODO: ADD ---
                    initValue: chooseBotomSheet == ChooseBotomSheet.add
                        ? null
                        : 'Title Employee',
                    pIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: PathIcons.name,
                    ),
                    keybordType: TextInputType.name,
                    onValidator: (value) => AppValidators.isEmpty(value),
                    onSaved: (value) {
                      supController.addEmployeeMap
                          .addAll({KeyFirebase.nameEmp: value});
                    },
                  ),
                  Divider(
                    color: AppColors.whiteColor,
                    thickness: 1.5.h,
                    indent: size.width / 8.w,
                    endIndent: size.width / 15.w,
                    height: 5.h,
                  ),

                  //^ *------- Adress Employ -------*/
                  SimpleFiled(
                    cursorColor: AppColors.whiteColor,
                    hint: 'Adress Employ',
                    initValue: chooseBotomSheet == ChooseBotomSheet.add
                        ? null
                        : 'Adress Employ',
                    pIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: PathIcons.name,
                    ),
                    keybordType: TextInputType.name,
                    onValidator: (value) => AppValidators.isEmpty(value),
                    onSaved: (value) {
                      supController.addEmployeeMap
                          .addAll({KeyFirebase.addressEmp: value});
                    },
                  ),
                  Divider(
                    color: AppColors.whiteColor,
                    thickness: 1.5.h,
                    indent: size.width / 8.w,
                    endIndent: size.width / 15.w,
                  ),
                  SizedBox(height: 10.h),

                  //& *------- Add BTN-------*/
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: CustomBtn(
                        btnText: chooseBotomSheet == ChooseBotomSheet.add
                            ? 'Save'
                            : 'Send',
                        textStyle: AppTheme.h6(context: context)
                            ?.copyWith(color: AppColors.movcolorLight),
                        backColor: AppColors.btnColorBottom,
                        onTap: () {
                          chooseBotomSheet == ChooseBotomSheet.add
                              ? supController.chack()
                              : supController.chack(
                                  chooseBotomSheet: ChooseBotomSheet.edit,
                                  docId: docId,
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: AppColors.darkGrey
    );
  }

  //& *================== Full Screen Dialog =================*/
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: const SizedBox(
          child: AppLoading(type: ChooseLoading.WEBPAGE),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: AppColors.movLight.withOpacity(.3),
      useSafeArea: true,
    );
  }

  //& *================== Cancel Dialog =================*/
  static void cancelDialog() => {Get.back()};
}

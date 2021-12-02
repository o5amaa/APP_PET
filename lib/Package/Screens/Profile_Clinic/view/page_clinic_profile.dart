import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/path_images.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/auth_control.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/page_sign_in.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/wrapper.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/widget/body_body_profile.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/widget/footer_body_profile.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/widget/hider_body_profil.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageClinicProfile extends StatelessWidget {
  static const String id = '/PageClinicProfile';
  const PageClinicProfile({Key? key}) : super(key: key);

  static final AuthControl _authControl = Get.find<AuthControl>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leadingWidth: 100.w,
        leading: Container(
          margin: EdgeInsets.only(top: 10.w),
          child: TextButton(
              onPressed: () {
                debugPrint('click log OUT');
                _authControl.signOut();
                
                // AuthControl().signOut();
              },
              child: Text(
                'Log Out',
                style: AppTheme.h20(context: context)
                    ?.copyWith(color: AppColors.movLight),
              )),
        ),
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.movLight),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // *Hider Image
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 30.h),
              // color: AppColors.whiteColor,//
              width: _size.width.w,
              height: _size.height * .3.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(PathImage.imgProfile),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(14.r)),
              ),
            ),
            // * Body  --
            Container(
              margin: EdgeInsets.only(top: 40.h),
              width: _size.width.w,
              height: _size.height.w * .4,
              // color:
              decoration: BoxDecoration(
                color: AppColors.gry,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(110.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  // * Hider Body
                  const HiderBodyProfilWidget(),
                  // * Body Body
                  BodyBodyProfileWidget(size: _size),
                  // * Footer Body
                  const FooterBodyProfileWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

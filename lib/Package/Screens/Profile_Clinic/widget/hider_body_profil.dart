import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/core/clinic_profile_controller.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:get/get.dart';

class HiderBodyProfilWidget extends StatelessWidget {
  const HiderBodyProfilWidget({
    Key? key,
  }) : super(key: key);

  static final ClinicProfileController _profileController =
      Get.find<ClinicProfileController>();

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_profileController.getUserMap?[KeyFirebase.userNmae]}',
      style: AppTheme.h25(context: context)
          ?.copyWith(color: AppColors.movcolorLight),
    );
  }
}

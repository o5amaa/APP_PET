import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/core/clinic_profile_controller.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlerteDialogWidget extends StatelessWidget {
  const AlerteDialogWidget({
    Key? key,
    required Size size,
    required ClinicProfileController profileController,
  })  : _size = size,
        _profileController = profileController,
        super(key: key);

  final Size _size;
  final ClinicProfileController _profileController;

  @override
  Widget build(BuildContext context) {
    return
        // GetBuilder<ImgProfileController>(
        //   init: ImgProfileController(),
        //   builder: (controller) =>
        SizedBox(
      width: _size.width,
      height: _profileController.image != null
          ? _size.height / 8
          : _size.height / 10,
      // color: AppColors.whiteColor,
      child: Column(
        children: [
          // * Gallery
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              onTap: () async {
                debugPrint('Gallery');
                _profileController.imgGlary();
              },
              child: ListTile(
                title: Text(
                  'Gallery',
                  style: AppTheme.h16(context: context),
                ),
                leading: PathIcons.gallery,
              ),
            ),
          ),

          Divider(
            color: AppColors.whiteColor,
            height: 6.h,
            thickness: 1.h,
            endIndent: 12.w,
            indent: 12.w,
          ),

          // *  Remov Image
          if (_profileController.image != null)
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                onTap: () {
                  debugPrint('Remov');
                  _profileController.setImage = null;
                },
                child: ListTile(
                  title: Text(
                    'Remov Image',
                    style: AppTheme.h16(context: context),
                  ),
                  leading: PathIcons.trash,
                ),
              ),
            ),
        ],
      ),
      // ),
    );
  }
}

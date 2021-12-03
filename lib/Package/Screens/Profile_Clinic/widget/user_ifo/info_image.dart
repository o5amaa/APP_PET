import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoImage extends StatelessWidget {
  const InfoImage({required void Function()? onPressed, Key? key})
      : _onPressed = onPressed,
        super(key: key);

  final void Function()? _onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Container(
          // ** BackGround ..
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: AppColors.btnColorBottom),
          ),
          child: Stack(
            children: [
              // * image
              Container(
                height: 90.w,
                width: 90.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppColors.whiteColor),
                  color: AppColors.movLight,
                  image: const DecorationImage(
                    image: //(_provideImage.image == null)
                        // ?
                        AssetImage(PathImage.imgUserpng),
                    //       : FileImage(_provideImage.image!) as ImageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // * Icon add image ..
              Positioned(
                bottom: 1,
                right: 6.w,
                child: Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: BoxDecoration(
                    color: AppColors.pinkColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    color: AppColors.pinkColor,
                    icon: Icon(Icons.add, color: AppColors.whiteColor),
                    onPressed: _onPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

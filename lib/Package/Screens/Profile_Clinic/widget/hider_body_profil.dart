import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';

class HiderBodyProfilWidget extends StatelessWidget {
  const HiderBodyProfilWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Specialized Veterinary Clinic',
      style: AppTheme.h25(context: context)
          ?.copyWith(color: AppColors.movcolorLight),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SimpleFiled extends StatelessWidget {
  const SimpleFiled({
    Key? key,
    String? initValue,
    TextInputType? keybordType = TextInputType.text,
    bool? isObscurText,
    void Function(String)? onChanged,
    String? Function(String?)? onValidator,
    void Function(String?)? onSaved,
    TextEditingController? onController,
    String? hint,
    Widget? pIcon,
    Widget? sIcon,
    TextStyle? style,
    void Function()? onSIcon,
  })  : _initValue = initValue,
        _keybordType = keybordType,
        _isObscurText = isObscurText,
        _onChanged = onChanged,
        _onValidator = onValidator,
        _onController = onController,
        _onSaved = onSaved,
        _hint = hint,
        _pIcon = pIcon,
        _sIcon = sIcon,
        _onSIcon = onSIcon,
        _style = style,
        super(key: key);

  final String? _initValue;
  final TextInputType? _keybordType;
  final bool? _isObscurText;
  final void Function(String)? _onChanged;
  final String? Function(String?)? _onValidator;
  final TextEditingController? _onController;
  final TextStyle? _style;

  // ? decoration
  final String? _hint;
  final Widget? _pIcon;
  final Widget? _sIcon;
  final void Function()? _onSIcon;
  final void Function(String?)? _onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // * قيمة ديفولت
      initialValue: _initValue,
      //* تغيير لون المؤشر
      cursorColor: !AppTheme.getTheme(context: context)
          ? AppColors.whiteColor
          : AppColors.blackColor,
      //* نوع التكست المدخل
      keyboardType: _keybordType, //?? TextInputType.text,
      //* تشفير النص المدخل
      obscureText: _isObscurText ?? false,
      // * دالة تعمل اثناء الادخال
      onChanged: _onChanged,
      // * الفحص
      validator: _onValidator,
      // * تتنفذ لمن يكون النص فيه ولا اي غلاط
      onSaved: _onSaved,
      controller: _onController,
      // ? تصميم
      style: _style ??
          AppTheme.h16(context: context)?.copyWith(
              color: AppTheme.getTheme(context: context)
                  ? AppColors.blackColor
                  : AppColors.whiteColor),
      // ^^ لون الخط
      decoration: InputDecoration(
        focusColor: AppColors.whiteColor,
        hoverColor: AppColors.whiteColor,
        labelText: _hint?.tr,
        labelStyle: AppTheme.h16(context: context)
            ?.copyWith(color: AppColors.greyLight),
        // * بدون بردر
        border: InputBorder.none,
        // * كلمة توضيحية
        // hintText: _hint?.tr,
        // hintStyle: AppTheme.h16(context: context),
        // * اكيون قبل التكست
        prefixIcon: _pIcon,
        // * ايكون في الجهه المقابلة
        // * *** ***** Icon btn
        suffixIcon: _sIcon != null
            ? InkWell(
                borderRadius: BorderRadius.circular(40.r),
                onTap: _onSIcon,
                child: _sIcon,
              )
            : null,
        // * *** *****
        // ! ....... بردر قبل الدخول الي التكست........
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.darkGrey,
            width: 1.5,
          ),
        ),
        // ! بردر بعد الدخول الي التكست
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.darkGrey,
            width: 1.5,
          ),
        ),
        // ! بردر اثناء الخطاء
        errorBorder: OutlineInputBorder(
          // * حواف البردر
          borderRadius: BorderRadius.circular(20.r),
          // * لون البردر
          borderSide: BorderSide(color: AppColors.torchReda),
        ),
        // ! بردر اثناء الدخال عند وجود ايرور
        focusedErrorBorder: OutlineInputBorder(
          // * حواف البردر
          borderRadius: BorderRadius.circular(20.r),
          // * لون البردر
          borderSide: BorderSide(color: AppColors.torchReda),
        ),
      ),
    );
  }
}

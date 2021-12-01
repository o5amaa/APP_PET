import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/view/page_clinic_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final String title = 'Sign In Page -- ..';
  // *
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var obscurText = true.obs;
  FaIcon iconSuffix = PathIcons.eyeIcon;
  // *
  var email = ''.obs, password = ''.obs;
  // **
  TextEditingController? emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
  }

  void chackInput() {
    if (!keyForm.currentState!.validate()) {
      // ignore: todo
      Get.offNamed(PageClinicProfile.id); //TODO
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Sign UP!");
    //
  }

  // * Show Pass ..
  void viewPass() {
    if (obscurText.value) {
      iconSuffix = PathIcons.eyeSlashIcon;
      obscurText(false);
    } else {
      iconSuffix = PathIcons.eyeIcon;
      obscurText(true);
    }
  }

  // ^^ ^^^^^^^^^^^
}

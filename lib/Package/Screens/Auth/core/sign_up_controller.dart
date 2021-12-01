import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  String title = 'SIGN Up';
  // ^
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var obscurText = true.obs;
  FaIcon iconSuffix = PathIcons.eyeIcon;

  //

  var name = ''.obs,
      email = ''.obs,
      password = ''.obs,
      location = ''.obs,
      hours = ''.obs;

  TextEditingController? nameController,
      emailController,
      passwordController,
      locationController,
      hoursController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    locationController = TextEditingController();
    hoursController = TextEditingController();
  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    locationController?.dispose();
    hoursController?.dispose();
  }

  void chackInput() {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Sign UP!");
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
}

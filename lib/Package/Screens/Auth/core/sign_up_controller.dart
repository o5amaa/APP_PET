import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/view/page_clinic_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  String title = 'SIGN Up';
  // ^
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var obscurText = true.obs;
  FaIcon iconSuffix = PathIcons.eyeIcon;

  Rx isLodeng = false.obs, setMessage = ''.obs;
  // * Firebase ..
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RxMap dataRegister = {}.obs;

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

  void chackInput() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Sign UP!");
    User? _user = await register(
        email: dataRegister[KeyFirebase.email],
        password: dataRegister[KeyFirebase.pass]);
    if (_user != null) {
      // Get.toNamed(PageClinicProfile.id);
      Get.snackbar('INFO', 'ok');
    } else {
      Get.snackbar('Error', '$setMessage');
    }
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

  // && *********** Sign UP *********
  Future register({required String email, required String password}) async {
    try {
      debugPrint('$email \n $password');
      // isLodeng.value = true;
      isLodeng(true);
      UserCredential _authResult =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      late User _user;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _user = _authResult.user!;
        isLodeng(false);
      }
      return _user;
    } on StdinException {
      isLodeng(false);
      setMessage.value = 'No internit,please connect to internit.';
    } on FirebaseAuthException catch (error) {
      isLodeng(false);
      setMessage.value = error.message ?? '';
    } catch (e) {
      isLodeng(false);
      debugPrint('$e');
      setMessage.value = '$e';
    }
  }
}

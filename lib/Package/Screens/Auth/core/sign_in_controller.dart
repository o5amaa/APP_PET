import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
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
  TextEditingController? emailController, passwordController;

  Rx isLodeng = false.obs, setMessage = ''.obs;
  // * Firebase ..
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RxMap dataLogin = {}.obs;

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

  void chackInput() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Sign UP!");
    User? _user = await login(
        email: dataLogin[KeyFirebase.email],
        password: dataLogin[KeyFirebase.pass]);
    if (_user != null) {
      // Get.snackbar('info', 'Ok');
      Get.offAllNamed(PageClinicProfile.id);
    } else {
      Get.snackbar('Error', '$setMessage');
    }
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

  // && *********** Sign IN *********

  Future<User?> login({required String email, required String password}) async {
    try {
      debugPrint('Sin in $email \n $password');
      isLodeng(true);
      UserCredential _authResult = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
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

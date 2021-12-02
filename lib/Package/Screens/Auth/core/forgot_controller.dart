import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  final String title = 'Forget Password';
  // *
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  Rx email = ''.obs;
  TextEditingController? emailController;

  // ^
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Rx isLodeng = false.obs, setMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    isLodeng(false);
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    isLodeng(false);
    emailController?.dispose();
  }

  // * **** chack *****
  void chackInput() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Forgot PASS!");
    bool _result = await resetPassword(email: email.value.toString());
    if (_result) {
      debugPrint('******************************');
      Get.back();
    } else {
      Get.snackbar('Error', '$setMessage');
    }
  }

  // && *********** Forgot ***********
  Future<bool> resetPassword({required String email}) async {
    try {
      isLodeng(true);
      await firebaseAuth.sendPasswordResetEmail(email: email);
      isLodeng(false);
      return true;
    } on StdinException {
      isLodeng(false);
      setMessage.value = 'No internit,please connect to internit.';
      return false;
    } on FirebaseAuthException catch (error) {
      isLodeng(false);
      setMessage.value = error.message ?? '';
      return false;
    } catch (e) {
      isLodeng(false);
      debugPrint('$e');
      setMessage.value = '$e';
      return false;
    }
  }
}

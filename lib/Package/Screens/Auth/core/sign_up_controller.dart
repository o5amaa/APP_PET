import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Model/user_model.dart';
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
  CollectionReference collectionUser =
      FirebaseFirestore.instance.collection(KeyFirebase.colUser);

  RxMap dataRegister = {}.obs;
  // ModelUser? modelUser;
  ModelUser modelUser = ModelUser();
  //

  var name = ''.obs,
      location = ''.obs,
      hours = ''.obs,
      email = ''.obs,
      password = ''.obs;

  TextEditingController? nameController,
      locationController,
      hoursController,
      emailController,
      passwordController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    locationController = TextEditingController();
    hoursController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
    nameController?.dispose();
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

    bool _result = await addInfoUser(modelUser: modelUser);
    if (_result) {
      isLodeng(false);
    } else {
      isLodeng(true);
      Get.snackbar('ERROR', setMessage.value);
    }

    if (_user != null) {
      Get.offAllNamed(PageClinicProfile.id);
      // Get.snackbar('INFO', 'ok');
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

  // ? ******* Get User *************
  User get userData => firebaseAuth.currentUser!;

  // ^ ********** Add IFO User ********
  Future<bool> addInfoUser({required ModelUser modelUser}) async {
    try {
      modelUser.id = userData.uid;
      modelUser.email = userData.email;
      modelUser.userRole = '2'; //! Defult Role .. 2=> ??????????
      modelUser.fullName = dataRegister[KeyFirebase.userNmae];
      // modelUser.image = '';
      modelUser.location = dataRegister[KeyFirebase.location];
      modelUser.workingHours = dataRegister[KeyFirebase.workingHours];

      await collectionUser.doc(modelUser.id).set(modelUser.toMap());
      debugPrint('$modelUser');
      return true;
    } catch (e) {
      setMessage.value = '$e';
      return false;
    }
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Model/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ClinicProfileController extends GetxController {
  final String title = 'Clinic Profile';
  //  **
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Rx isLodeng = false.obs, notFuond = true.obs, setMessage = ''.obs;

  var name = ''.obs, location = ''.obs, hours = ''.obs;

  TextEditingController? nameController, locationController, hoursController;

  final _picker = ImagePicker();
  File? image;

  ModelUser? modelUser;

  CollectionReference colReference =
      FirebaseFirestore.instance.collection(KeyFirebase.colUser);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RxMap? userMap = {}.obs;

  // **
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    locationController = TextEditingController();
    hoursController = TextEditingController();
    // &&
    getUserInfo();
    // &&
  }

  @override
  void onClose() {
    super.onClose();
    nameController?.dispose();
    locationController?.dispose();
    hoursController?.dispose();
  }
  // *

  // **chack
  void chackInput() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Sign UP!");
    if (image == null) {
      Get.snackbar(
        'ERROR!!',
        'No Selected an Image.',
        // animationDuration: const Duration(milliseconds: 50000),
        backgroundColor: AppColors.movLight,
        colorText: AppColors.whiteColor,
        backgroundGradient: LinearGradient(
          colors: AppColors.waitDataColors,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      );
    } else {
      String _pathImage = path.basename(image!.path);
      String _directory = 'user/$_pathImage';
      String _urlPhoto = await uplodeImage(
        directory: _directory,
        image: image!,
      );
      if (_urlPhoto.isNotEmpty) {
        modelUser?.image = _urlPhoto;
      } else {
        Get.snackbar(
          'ERROR!!',
          '$setMessage',
        );
      }
      Get.back();
    }
  }
  // ~ *****

  //^ ******* Get Image **********
  Future<File?> getImage({bool isCamera = false}) async {
    try {
      final _pickedimage = await _picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (_pickedimage != null) {
        return File(_pickedimage.path);
      } else {
        throw Exception('not show Image');
      }
    } catch (e) {
      debugPrint('Error:  $e');
    }
  }

// ^ ********** * imgGlary * ******************
  void imgGlary() async {
    File? _imagePic = await getImage();
    if (_imagePic != null) {
      setImage = _imagePic;
      // image = _imagePic;
      notFuond(false);
      debugPrint('Image:  **** *** *** *** *** \n ${image?.path}');
      Get.back();
    }
  }

  // ^ ***** Set Img ******
  set setImage(File? image) {
    this.image = image;
    if (image == null) {
      notFuond(false);
      this.image = null;
      Get.back();
    }
    debugPrint('set Img:  $image');
  }

  // ^ ***** Uplode Img ******
  Future<String> uplodeImage({
    required String directory,
    required File image,
  }) async {
    try {
      isLodeng(true);
      Reference _ref = FirebaseStorage.instance.ref(directory);
      UploadTask _uploadTask = _ref.putFile(image);
      TaskSnapshot _snapshot = await _uploadTask.whenComplete(() => {});
      isLodeng(false);
      return await _snapshot.ref.getDownloadURL();
    } catch (e) {
      isLodeng(false);
      setMessage.value = '$e';
      return '';
    }
  }

  // ^ ************* Get info User *********************
  getUserInfo() async {
    User? _userData = firebaseAuth.currentUser;
    try {
      await colReference.doc(_userData?.uid).get().then(
        (value) {
          isLodeng(true);
          if (value.data() != null) {
            isLodeng(true);
            debugPrint('*********************** \n${value.data()}');
            userMap?.addAll(value.data() as Map);
            isLodeng(false);
          } else {
            Get.snackbar(
              'Info!!',
              'There are no data.',
              colorText: AppColors.whiteColor,
              backgroundColor: AppColors.movLight,
              backgroundGradient: LinearGradient(
                colors: AppColors.infoColor,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              duration: const Duration(seconds: 4),
            );
          }
        },
      );
    } catch (e) {
      debugPrint('ERROR CACH GET DATA USER:\n $e');
    }
  }
}

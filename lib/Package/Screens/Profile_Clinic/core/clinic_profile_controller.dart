import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Model/user_model.dart';
import 'package:flutter_pet/Package/Components/Toast/simple_toast.dart';
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

  ModelUser modelUser = ModelUser();

  CollectionReference colReference =
      FirebaseFirestore.instance.collection(KeyFirebase.colUser);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RxMap? getUserMap = {}.obs, eidtUserMap = {}.obs;

  // **
  @override
  void onInit() {
    getUserInfo();
    super.onInit();
    nameController = TextEditingController();
    locationController = TextEditingController();
    hoursController = TextEditingController();
    // &&
    // &&
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint('onReady');
  }

  @override
  void onClose() {
    super.onClose();
    nameController?.dispose();
    locationController?.dispose();
    hoursController?.dispose();
  }
  // *

  // * *************** *chack* ****************
  void chackInput() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    keyForm.currentState!.save();
    debugPrint("Click btn Sign UP!");
    if (image == null) {
      Get.snackbar('ERROR!!', 'No Selected an Image.',
          backgroundColor: AppColors.movLight,
          colorText: AppColors.whiteColor,
          backgroundGradient: LinearGradient(
            colors: AppColors.waitDataColors,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ));
    } else {
      String _pathImage = path.basename(image!.path);
      String _directory = 'user/$_pathImage';
      String _urlPhoto =
          await uplodeImage(directory: _directory, image: image!);

      if (_urlPhoto.isNotEmpty) {
        modelUser.image = _urlPhoto;
        // & ************ Save in database info user ***************

        bool _result = await updateInfoUser(modelUser: modelUser);

        if (_result) {
          isLodeng(false);
        } else {
          isLodeng(false);
          simpleToast(message: 'No update:\n \n  $setMessage');
        }
      } else {
        Get.snackbar('ERROR!!', '_urlPhoto is Empty\n $_urlPhoto',
            duration: const Duration(seconds: 5));
      }

      debugPrint('ok');
      Get.back();
    }
  }

  //^ ******* Get Image From Picker **********
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

// ^ ********** * imgGlary on Tap * ******************
  void imgGlary() async {
    File? _imagePic = await getImage();
    if (_imagePic != null) {
      setImage = _imagePic;
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

  // ^ ***** Uplode Img To FIREBASE ******
  Future<String> uplodeImage({
    required String directory,
    required File image,
  }) async {
    try {
      isLodeng(true);
      Reference _ref = FirebaseStorage.instance.ref(directory);
      UploadTask _uploadTask = _ref.putFile(image);
      TaskSnapshot _snapshot = await _uploadTask.whenComplete(() => {
            isLodeng(false),
            simpleToast(
                message: 'Uploded image to firebase.\n \n \n ${image.path}'),
            debugPrint('/*/*/ Uploded image /*/*/'),
          });
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
            debugPrint('************** \n${value.data()}');
            getUserMap?.addAll(value.data() as Map);
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
              duration: const Duration(seconds: 5),
            );
            isLodeng(false);
          }
        },
      ).catchError((error) {
        Get.snackbar('ERROR??', 'Failed to GET DATA user`s property: $error');
      });
    } catch (e) {
      debugPrint('ERROR CACH GET DATA USER:\n $e');
    }
  }

  // ^ ************ *Update data info user* ******************
  Future<bool> updateInfoUser({required ModelUser modelUser}) async {
    User? _currentUserData = firebaseAuth.currentUser;
    try {
      isLodeng(true);
      modelUser.id = _currentUserData?.uid;
      modelUser.email = _currentUserData?.email;
      modelUser.userRole = '2';

      await colReference
          .doc(modelUser.id)
          .update(modelUser.toMap())
          .then((value) {
        Get.snackbar(
          'INFO!!',
          '\n \n Editing completed successfully.',
          duration: const Duration(seconds: 6),
          backgroundGradient: LinearGradient(colors: AppColors.infoColor),
          colorText: AppColors.whiteColor,
        );
        debugPrint('=================Updated=============== \n');
        debugPrint(value as String);
        isLodeng(false);
      }).catchError((error) {
        Get.snackbar(
          'ERROR',
          'Failed to update user:\n $error',
          duration: const Duration(seconds: 6),
          backgroundColor: AppColors.torchReda,
          colorText: AppColors.whiteColor,
        );
      });
      return true;
    } catch (e) {
      setMessage.value = 'ERROR CATCH UPDATE : \n $e';
      return false;
    }
  }
}

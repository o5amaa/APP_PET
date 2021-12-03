import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ClinicProfileController extends GetxController {
  final String title = 'Clinic Profile';
  //  **
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Rx isLodeng = false.obs, setMessage = ''.obs;

  RxMap dataEdit = {}.obs;

  var name = ''.obs, location = ''.obs, hours = ''.obs;

  TextEditingController? nameController, locationController, hoursController;

  // **
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    locationController = TextEditingController();
    hoursController = TextEditingController();
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
  }

  final _picker = ImagePicker();
  File? _image;

  Future<void> getImage({bool isCamera = false}) async {
    try {
      final _pickedimage = await _picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (_pickedimage != null) {
        _image = File(_pickedimage.path);
      } else {
        throw Exception('not show Image');
      }
    } catch (e) {
      debugPrint('Error:  $e');
    }
  }
}

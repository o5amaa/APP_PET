import 'package:flutter_pet/Package/Screens/Profile_Clinic/core/clinic_profile_controller.dart';
import 'package:get/get.dart';

class ClinicProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClinicProfileController>(ClinicProfileController());
  }
}

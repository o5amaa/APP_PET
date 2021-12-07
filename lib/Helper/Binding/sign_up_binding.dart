import 'package:flutter_pet/Package/Screens/Auth/core/sign_up_controller.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/core/clinic_profile_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
    Get.put<ClinicProfileController>(ClinicProfileController());

  }
}

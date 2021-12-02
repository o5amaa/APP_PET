import 'package:flutter_pet/Package/Screens/Auth/core/auth_control.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/sign_in_controller.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/sign_up_controller.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/core/clinic_profile_controller.dart';
import 'package:get/get.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthControl>(AuthControl());
    // Get.put(AuthControl());
    // *
    Get.put<SignInController>(SignInController());
    Get.put<SignUpController>(SignUpController());
    // *
    Get.put<ClinicProfileController>(ClinicProfileController());
  }
}

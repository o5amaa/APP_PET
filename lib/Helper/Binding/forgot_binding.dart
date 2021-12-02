import 'package:flutter_pet/Package/Screens/Auth/core/forgot_controller.dart';
import 'package:get/get.dart';

class ForgorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotController>(ForgotController());
  }
}

import 'package:flutter_pet/Package/Screens/sup_test/controller/sup_controller.dart';
import 'package:get/get.dart';

class SupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SupController>(SupController());
  }
}

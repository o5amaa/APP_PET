import 'package:flutter_pet/Package/Screens/Test/core/test_controller.dart';
import 'package:get/get.dart';

class TestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TestController>(TestController());
  }
}

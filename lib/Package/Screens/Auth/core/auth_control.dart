import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pet/Package/Screens/Test/view/page_test.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthControl extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // * **** Sign Out ****
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    Get.offAllNamed(PageTest.id);
  }

  // * **** Get User ****

  Stream<User?> get user => firebaseAuth.authStateChanges().map((user) => user);
}

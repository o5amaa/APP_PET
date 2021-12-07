import 'package:flutter_pet/Helper/Binding/clinic_profile_binding.dart';
import 'package:flutter_pet/Helper/Binding/forgot_binding.dart';
import 'package:flutter_pet/Helper/Binding/sign_in_binding.dart';
import 'package:flutter_pet/Helper/Binding/sign_up_binding.dart';
import 'package:flutter_pet/Helper/Binding/test_binding.dart';
import 'package:flutter_pet/Helper/Binding/wrapper_binding.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/page_forgot.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/page_sign_in.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/page_sign_up.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/wrapper.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/view/page_clinic_profile.dart';
import 'package:flutter_pet/Package/Screens/Test/view/page_test.dart';
import 'package:get/get.dart';

class AppRouters {
  static var route = [
    GetPage(
      name: PageTest.id,
      page: () => const PageTest(),
      binding: TestBinding(),
      // ^ ***************************
      fullscreenDialog: false,
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: PageSignUp.id,
      page: () => const PageSignUp(),
      binding: SignUpBinding(),
      // ^ **********************
      fullscreenDialog: false,
      transition: Transition.rightToLeftWithFade,
      // curve: Curves.bounceInOut,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageSignIn.id,
      page: () => const PageSignIn(),
      binding: SignInBinding(),
      // ^ ******************
      fullscreenDialog: true,
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: PageClinicProfile.id,
      page: () => const PageClinicProfile(),
      binding: ClinicProfileBinding(),
      // ^ **************************

      fullscreenDialog: true,
      transition: Transition.zoom,
      // curve: Curves.bounceInOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: PageForgot.id,
      page: () => const PageForgot(),
      binding: ForgorBinding(),
// ^ ******************
      fullscreenDialog: true,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: Wrapper.id,
      page: () => const Wrapper(),
      binding: WrapperBinding(),
      // ^ ***************************
      fullscreenDialog: false,
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 600),
    ),
  ];
}

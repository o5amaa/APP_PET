import 'package:flutter/material.dart';
import 'package:flutter_pet/Package/Components/Loading/app_loading.dart';
import 'package:flutter_pet/Package/Components/Loading/enum_loading.dart';
import 'package:flutter_pet/Package/Screens/Auth/core/auth_control.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/page_sign_in.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/page_sign_up.dart';
import 'package:flutter_pet/Package/Screens/Profile_Clinic/view/page_clinic_profile.dart';

class Wrapper extends StatelessWidget {
  static const String id = '/Wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthControl().user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: AppLoading(type: ChooseLoading.PAGE),
            ),
          );
        }
        if (snapshot.hasData) {
          return const PageClinicProfile();
        } else {
          return const PageSignIn();
        }
      },
    );
  }
}

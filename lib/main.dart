import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Package/Components/Errors/error_init_firebase.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'Helper/Theme/custome_theme.dart';
import 'Package/Screens/Test/view/page_test.dart';
import 'Router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //? Acces to Engine
  // ^^
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initFirebase = Firebase.initializeApp();
    return FutureBuilder(
      future: _initFirebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorInitFirebase();
        } else if (snapshot.hasData) {
          //^ return data
          return ScreenUtilInit(
            designSize: const Size(360, 960),
            builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.lightTheme(context),
              // router
              initialRoute: PageTest.id,
              getPages: AppRouters.route,
            ),
          );
        } else {
          // ^ Data Waiting
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.waitDataColors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

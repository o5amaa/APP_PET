import 'package:flutter/material.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/wrapper.dart';
import 'package:flutter_pet/Package/Screens/Test/core/test_controller.dart';
import 'package:flutter_pet/Package/Screens/sup_test/controller/sup_controller.dart';
import 'package:flutter_pet/Package/Screens/sup_test/view/page_sup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageTest extends StatelessWidget {
  static const String id = '/PageTest';
  const PageTest({Key? key}) : super(key: key);

  static final TestController _testController = Get.find();
  static SupController supController = Get.put<SupController>(SupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_testController.titlePage),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //^ *------- Go to ohood -------*/

            TextButton(
              child: const Text('Go'),
              onPressed: () {
                // Get.toNamed(PageSignUp.id);
                Get.toNamed(Wrapper.id);
              },
            ),
            SizedBox(height: 100.h),
            //^ *======= Go to Sup Test =======*/

            TextButton(
              child: const Text('Go Sup Test'),
              onPressed: () {
                Get.toNamed(PageSup.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

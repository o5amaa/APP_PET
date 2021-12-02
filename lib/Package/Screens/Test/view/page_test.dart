import 'package:flutter/material.dart';
import 'package:flutter_pet/Package/Screens/Auth/view/wrapper.dart';
import 'package:flutter_pet/Package/Screens/Test/core/test_controller.dart';
import 'package:get/get.dart';

class PageTest extends StatelessWidget {
  static const String id = '/PageTest';
  const PageTest({Key? key}) : super(key: key);

  static final TestController _testController = Get.find();

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
            TextButton(
              child: const Text('Go'),
              onPressed: () {
                // Get.toNamed(PageSignUp.id);
                Get.toNamed(Wrapper.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

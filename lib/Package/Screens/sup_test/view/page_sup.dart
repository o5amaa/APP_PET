import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';
import 'package:flutter_pet/Package/Components/Loading/app_loading.dart';
import 'package:flutter_pet/Package/Components/Loading/enum_loading.dart';
import 'package:flutter_pet/Package/Screens/sup_test/controller/sup_controller.dart';
import 'package:flutter_pet/Package/Screens/sup_test/widget/enum_bottomshet.dart';
import 'package:flutter_pet/Package/Screens/sup_test/widget/method_dilog.dart';
import 'package:flutter_pet/Services/Themes/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageSup extends StatelessWidget {
  static const String id = '/PageSup';
  const PageSup({Key? key}) : super(key: key);

  // static final

  @override
  Widget build(BuildContext context) {
    SupController _supController = Get.find<SupController>();
    String _empty = 'Empty';
    Size _size = MediaQuery.of(context).size;
    debugPrint('${_supController.emp?.length}');

    return Scaffold(
        // ?======= Appbar =======*/
        appBar: AppBar(
          title: Text(
            _supController.title,
            style: AppTheme.h16(context: context),
          ),
          actions: [
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              radius: 100.r,
              borderRadius: BorderRadius.circular(100.r),
              splashColor: AppColors.movLight.withOpacity(.5),
              onTap: () => {
                debugPrint('ADD Click ,,'),
                //~*======= Bottom Sheet =======*/
                CustomDilogMethod.buildBottmSheetMethod(
                  supController: _supController,
                  context: context,
                  size: _size,
                ),
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                width: 90.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: PathIcons.add,
                // child: IconButton(
                //   icon: PathIcons.add,
                //   onPressed: () => {
                //     debugPrint('ADD Click ,,'),

                //     //~*======= Bottom Sheet =======*/
                //     CustomDilogMethod.buildBottmSheetMethod(
                //       supController: _supController,
                //       context: context,
                //       size: _size,
                //     ),
                //   },
                // ),
              ),
            ),
          ],
        ),
        // *------- Body -------*/

        body: GetX<SupController>(
          init: Get.put<SupController>(SupController()),
          builder: (controller) => controller.emp!.isEmpty ||
                  controller.emp == null && controller.isLaodeng(true)
              ? const AppLoading(type: ChooseLoading.WEBPAGE)
              : ListView.builder(
                  itemCount: controller.emp?.length,
                  itemBuilder: (context, index) => Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    color: AppColors.darkGrey,
                    child: ListTile(
                      title: Text(
                        controller.emp?[index]?[KeyFirebase.nameEmp] ?? '',
                        style: AppTheme.h16(context: context),
                      ),
                      subtitle: Text(
                        controller.emp?[index]?[KeyFirebase.addressEmp] ?? '',
                        style: AppTheme.b2(context: context)
                            ?.copyWith(color: AppColors.whiteColor),
                      ),
                      leading: CircleAvatar(
                        child: Text(
                          controller.emp?[index]?[KeyFirebase.nameEmp]
                                  ?.substring(0, 1) ??
                              _empty.capitalize ??
                              "O",
                          style: AppTheme.h25(context: context),
                        ),
                        backgroundColor: AppColors.greyLight,
                      ),

                      //&*================== Delete Btin Icon =================*/
                      trailing: IconButton(
                        icon: PathIcons.delete,
                        onPressed: () => {
                          debugPrint('/*======= Delete =======*/'),
                          CustomDilogMethod.displayDeleteDialog(
                            context,
                            controller.emp?[index]?[KeyFirebase.docIdEmp],
                            onConfirm: () {
                              var _backDelet = controller.deleteData(controller
                                  .emp?[index]?[KeyFirebase.docIdEmp]);
                              // ignore: unrelated_type_equality_checks
                              if (_backDelet != false) {
                                Get.back();
                              }
                            },
                          ),
                        },
                      ),
                      onTap: () {
                        debugPrint('/*======= Edit =======*/');
                        debugPrint('/*======= Edit $index =======*/');
                        controller.nameController.text =
                            controller.emp?[index]?[KeyFirebase.nameEmp];

                        controller.addressController.text =
                            controller.emp?[index]?[KeyFirebase.addressEmp];

                        debugPrint(
                            '${controller.emp?[index]?[KeyFirebase.docIdEmp]}');
                        debugPrint(
                            '${controller.emp?[index]?[KeyFirebase.addressEmp]}');
                        debugPrint(
                            '${controller.emp?[index]?[KeyFirebase.nameEmp]}');

                        debugPrint(
                            'conttroller.text:: ${controller.addressController.text}');

                        //~*======= Bottom Sheet =======*/
                        CustomDilogMethod.buildBottmSheetMethod(
                            supController: _supController,
                            context: context,
                            size: _size,
                            chooseBotomSheet: ChooseBotomSheet.edit,
                            docId: controller.emp?[index]
                                ?[KeyFirebase.docIdEmp],
                            nameEmp: controller.nameController.text,
                            addressEmp: controller.addressController.text);
                      },
                    ),
                  ),
                ),
        )
        // ^------- Footer -------*/
        );
  }
}

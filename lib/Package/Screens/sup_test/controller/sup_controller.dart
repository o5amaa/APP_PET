import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Theme/app_colors.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';
import 'package:flutter_pet/Model/employ_model.dart';
import 'package:flutter_pet/Package/Components/SnackBar/custom_snackbar.dart';
import 'package:flutter_pet/Package/Components/Toast/simple_toast.dart';
import 'package:flutter_pet/Package/Screens/sup_test/widget/enum_bottomshet.dart';
import 'package:flutter_pet/Package/Screens/sup_test/widget/method_dilog.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SupController extends GetxController {
// ^ *======= Title Page =======*/
  String title = 'Supe Page';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, addressController;
  RxBool isLaodeng = false.obs; //RxBool(false);

  //*================== Firebase =================*/
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference _reference;

  RxList<EmployeeModel> employeesList = RxList<EmployeeModel>([]);

  EmployeeModel employModel = EmployeeModel();
  RxMap<String, dynamic> addEmployeeMap = RxMap<String, dynamic>({});

  RxList<Map?>? emp = RxList<Map>([]);

  @override
  void onInit() {
    isLaodeng(false);
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    _reference = _firebaseFirestore.collection(KeyFirebase.colEmploy);
    // employeesList.bindStream(getAllEmployees());
    // getAllEmployees();
    getAllEmployees();
  }

  @override
  void onReady() {
    isLaodeng(false);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    isLaodeng(false);
    nameController.dispose();
    addressController.dispose();
  }

  //? *================== Clear Editing Controllers =================*/
  void clearEditingControllers() => {
        nameController.clear(),
        addressController.clear(),
      };

  // *======= Chack =======*/
  Future<void> chack({
    ChooseBotomSheet? chooseBotomSheet = ChooseBotomSheet.add,
    String? docId,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      formKey.currentState!.save();
      if (chooseBotomSheet == ChooseBotomSheet.add) {
        debugPrint('/*================== Click btn Add! =================*/');
        Future<bool> _back = addEmployees();
        // ignore: unrelated_type_equality_checks
        if (_back != false) {
          Get.back();
        }
      } else {
        debugPrint('/*======= Click ntn Edit! =======*/');
        //todo  =>>

        updateEployee(docId: docId);
      }
    }
  }

  //^ *======= Get All Employs =======*/

  //& *============= Get Employees with reale time list ============*/
  Future<void> getAllEmployees() async {
    try {
      isLaodeng(true);
      _reference.snapshots().listen((event) {
        isLaodeng(false);
        // qurySnap.value = event;
        if (event.docs.isNotEmpty) {
          for (var element in event.docs) {
            debugPrint('${element.data()}');
            // emp?.add(element.data() as Map<dynamic, dynamic>);
            emp?.add(element.data() as Map<dynamic, dynamic>);
          }
          debugPrint('All Emp:\n $emp');
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Get all employees',
            message: 'Employees Get successfully.',
            backgroundColor: AppColors.blueColor,
          );
        } else {
          debugPrint('/*================== on Data =================*/');
          emp?.clear();
          isLaodeng(false);
          CustomSnackBar.showSnackBar(
              context: Get.context,
              title: 'Wiring!!',
              message: 'There are no data.',
              backgroundColor: AppColors.pinkColor);
        }
      });
    } catch (e) {
      isLaodeng(false);
      debugPrint('ERROR Catch In Get EMP:\n $e');
      simpleToast(message: 'ERROR Catch In Get EMP:\n\n $e');
    }
  }

  Future<void> getAllEmployee() async {
    isLaodeng(true);
    await _reference.get().then((value) {
      isLaodeng(false);
      for (var element in value.docs) {
        //todo  TODO:: Edit this
        // debugPrint('${element.data()}');
        emp?.add(element.data() as Map<dynamic, dynamic>);
      }
      CustomSnackBar.showSnackBar(
        context: Get.context,
        title: 'Get Employee',
        message: 'Employee Get successfully.',
        backgroundColor: AppColors.blueColor,
      );
      Get.back();
    }).catchError(
      (onError) {
        isLaodeng(false);
        debugPrint('/*================== on Error =================*/');
        debugPrint(onError);
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: 'Error',
          message: 'Somthing went wrong',
          backgroundColor: Colors.green,
        );
      },
    );
  }

  //^ *================== Add new employ =================*/
  Future<bool> addEmployees() async {
    try {
      isLaodeng(true);
      return await _reference.doc().set(addEmployeeMap).then(
        (value) {
          isLaodeng(false);
          debugPrint('/*================== Then Add value =================*/');
          clearEditingControllers();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Employee Added',
            message: 'Employee added successfully.',
            backgroundColor: AppColors.greemColor,
          );
          return true;
        },
      ).catchError(
        (onError) {
          isLaodeng(false);
          clearEditingControllers();
          debugPrint('/*================== on Error =================*/');
          debugPrint('catchError == : ' + onError);
          simpleToast(
              message: 'Didn`t added.. please try again.',
              backgroundColor: AppColors.pinkColor);
          Get.back();
          return false;
        },
      );
    } catch (e) {
      debugPrint('Catch 500000: $e');
      simpleToast(
          message: "catch ERROR Add new \n $e",
          backgroundColor: AppColors.torchReda);
      return false;
    }
  }

  //^ *================== Edit Employee =================*/

  Future<void> updateEployee({required String? docId}) async {
    try {
      isLaodeng(true);
      await _reference.doc(docId).update(addEmployeeMap).then(
        (value) {
          isLaodeng(false);
          debugPrint(
              '/*================= Then Updeted value ================*/');
          clearEditingControllers();
          Get.back();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Employee Updete',
            message: 'Employee updeted successfully.',
            backgroundColor: AppColors.blueColor,
          );
        },
      ).catchError(
        (onError) {
          debugPrint('/*================= on Error Update ================*/');
          debugPrint(onError);
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Error Update',
            message: 'Didn`t update.. please try again.',
            backgroundColor: Colors.green,
          );
        },
      );
    } catch (e) {
      CustomDilogMethod.cancelDialog();
      debugPrint('Edit Employee Catch: \n $e');
    }
  }
}

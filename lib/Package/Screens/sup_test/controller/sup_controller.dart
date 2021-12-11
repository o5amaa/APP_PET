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
import 'package:uuid/uuid.dart';

class SupController extends GetxController {
// ^ *======= Title Page =======*/
  String title = 'All  Employys ';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, addressController;
  RxBool isLaodeng = false.obs; //RxBool(false);

  var nameEmp = ''.obs, addressEmp = ''.obs;

  //*================== Firebase =================*/
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference _reference;

  RxList<EmployeeModel> employeesList = RxList<EmployeeModel>([]);

  EmployeeModel employModel = EmployeeModel();
  RxMap<String, dynamic> addEmployeeMap = RxMap<String, dynamic>({});

  RxMap<String, dynamic> editEmployeeMap = RxMap<String, dynamic>({});

  RxList<Map?>? emp = RxList<Map>([]);

  //~ *================== UUID =================*/
  // RxString docId = ''.obs;
  Uuid uuid = const Uuid();

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
    //~*======= INFO =======*/
    String? docId,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      formKey.currentState!.save();
      if (chooseBotomSheet == ChooseBotomSheet.add) {
        debugPrint('/*================== Click btn Add! =================*/');
        Future<bool> _backAdd = addEmployees();
        // ignore: unrelated_type_equality_checks
        if (_backAdd != false) {
          Get.back();
        }
      } else {
        debugPrint('/*======= Click ntn Edit! =======*/');
        var _backEdit = updateEployee(
            docId: docId, addressEmp: addressEmp.value, nameEmp: nameEmp.value);
        // ignore: unrelated_type_equality_checks
        if (_backEdit != false) {
          Get.back();
        }
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
        if (event.docs.isNotEmpty) {
          emp?.clear();
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

//& *================== Get One Employee =================*/
  Future<void> getOneEmployee({required String docID}) async {
    isLaodeng(true);
    await _reference
        .where(KeyFirebase.docIdEmp, isEqualTo: docID)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        isLaodeng(false);
        debugPrint('$value');
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: 'Get Employee',
          message: 'Employee Get successfully.',
          backgroundColor: AppColors.blueColor,
        );
      } else {
        debugPrint('/*================== on Data =================*/');
        isLaodeng(false);
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Wiring!!',
            message: 'There are no data.',
            backgroundColor: AppColors.pinkColor);
      }
    }).catchError(
      (onError) {
        isLaodeng(false);
        debugPrint('/*================== on Error =================*/');
        debugPrint(onError);
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: 'Error',
          message: 'Somthing went wrong',
          backgroundColor: AppColors.pinkColor,
        );
      },
    );
  }

  //^ *================== Add new employ =================*/
  Future<bool> addEmployees() async {
    String _docID = uuid.v1();
    addEmployeeMap.addAll({KeyFirebase.docIdEmp: _docID});
    try {
      isLaodeng(true);
      return await _reference.doc(_docID).set(addEmployeeMap).then(
        (value) {
          isLaodeng(false);
          debugPrint('/*================== Then Add value =================*/');
          clearEditingControllers();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Employee Added',
            message: 'Employee added successfully.',
            backgroundColor: AppColors.greenColor,
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

  Future<bool> updateEployee({
    required String? docId,
    required String? addressEmp,
    required String? nameEmp,
  }) async {
    editEmployeeMap.addAll({
      KeyFirebase.nameEmp: nameEmp,
      KeyFirebase.addressEmp: addressEmp,
      KeyFirebase.docIdEmp: docId,
    });
    try {
      isLaodeng(true);
      return await _reference.doc(docId).update(editEmployeeMap).then(
        (value) {
          isLaodeng(false);
          debugPrint(
              '/*================= Then Updeted value ================*/');
          clearEditingControllers();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Employee Updete',
            message: 'Employee updeted successfully.',
            backgroundColor: AppColors.blueColor,
          );
          return true;
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
          return false;
        },
      );
    } catch (e) {
      CustomDilogMethod.cancelDialog();
      debugPrint('Edit Employee Catch: \n $e');
      return false;
    }
  }

  //^ *================== Delete Employee =================*/

  Future<bool> deleteData(docID) async {
    try {
      isLaodeng(true);
      return await _reference.doc(docID).delete().then(
        (value) {
          debugPrint('*================== Delete Employee =================*/');
          isLaodeng(false);
          CustomSnackBar.showSnackBar(
              context: Get.context,
              title: 'Delete Employee',
              message: 'The employee has been successfully deleted.',
              backgroundColor: AppColors.greenColor);
          return true;
        },
      ).catchError(
        (onError) {
          debugPrint(
              '*================ catchError Delete Employee ===============*/');
          isLaodeng(false);
          CustomSnackBar.showSnackBar(
              context: Get.context,
              title: 'Error',
              message: 'The employee was not deleted successfully.',
              backgroundColor: AppColors.torchReda);
          return false;
        },
      );
    } catch (e) {
      isLaodeng(false);
      debugPrint('Delete Employee Catch Error : \n $e');
      return false;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pet/Helper/Utils/key_firebase.dart';

class EmployeeModel {
  String? docId;
  String? name;
  String? address;

  EmployeeModel({
    this.docId,
    this.name,
    this.address,
  });

//*================== From Map JSON =================*/
  EmployeeModel.fromMap(DocumentSnapshot map)
      : assert(map != null as DocumentSnapshot),
        docId = map.id,
        name = map[KeyFirebase.nameEmp],
        address = map[KeyFirebase.addressEmp];

//*================== To Map JSON =================*/
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.docIdEmp] = docId;
    data[KeyFirebase.nameEmp] = name;
    data[KeyFirebase.addressEmp] = address;
    return data;
  }
}

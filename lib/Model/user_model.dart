import 'package:flutter_pet/Helper/Utils/key_firebase.dart';

class ModelUser {
  String? id;
  String? fullName;
  String? userRole;
  String? image;
  String? email;
  String? location;
  String? workingHours;

  ModelUser({
    this.id,
    this.fullName,
    this.userRole,
    this.image,
    this.email,
    this.location,
    this.workingHours,
  });

  ModelUser.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        id = data[KeyFirebase.id],
        email = data[KeyFirebase.email],
        fullName = data[KeyFirebase.userNmae],
        image = data[KeyFirebase.userImage],
        userRole = data[KeyFirebase.userRole],
        location = data[KeyFirebase.location],
        workingHours = data[KeyFirebase.workingHours];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.id] = id;
    data[KeyFirebase.userNmae] = fullName;

    data[KeyFirebase.userRole] = userRole;
    data[KeyFirebase.userImage] = image;
    data[KeyFirebase.email] = email;
    data[KeyFirebase.location] = location;
    data[KeyFirebase.workingHours] = workingHours;
    return data;
  }
}

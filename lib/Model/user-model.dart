// import 'package:insta_app/Helpers/Utils/key_firebase.dart';

// class ModelUser {
//   String? id;
//   String? fullName;
//   String? phone;
//   String? gender;
//   String? image;
//   String? email;

//   ModelUser({
//     this.id,
//     this.fullName,
//     this.phone,
//     this.gender,
//     this.image,
//     this.email,
//   });

//   ModelUser.fromMap(Map<String, dynamic> data)
//       : assert(data.isNotEmpty),
//         id = data[KeyFirebase.id],
//         email = data[KeyFirebase.email],
//         fullName = data[KeyFirebase.userNmae],
//         image = data[KeyFirebase.userImage],
//         gender = data[KeyFirebase.userGander],
//         phone = data[KeyFirebase.userPhone];

//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     // final Map<String, dynamic> data = <String, dynamic>{};
//     data[KeyFirebase.id] = id;
//     data[KeyFirebase.userNmae] = fullName;
//     data[KeyFirebase.userPhone] = phone;
//     data[KeyFirebase.userGander] = gender;
//     data[KeyFirebase.userImage] = image;
//     data[KeyFirebase.email] = email;
//     return data;
//   }
// }
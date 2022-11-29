import 'package:firebase_database/firebase_database.dart';

class AppUser {
  String? key;
  String email;
  String uid;
  String avatar;

  AppUser(this.key, this.email, this.uid, this.avatar);

  AppUser.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        email = json['email'] ?? "email",
        uid = json['uid'] ?? "uid",
        avatar = json['avatar'] ?? "avatar";

  toJson() {
    return {
      "email": email,
      "uid": uid,
      "avatar": avatar,
    };
  }
}

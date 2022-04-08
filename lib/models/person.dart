import 'package:firebase_auth/firebase_auth.dart';

class Person {
  String name, email, photoUrl, uid;

  Person.fromJson(Map<String, dynamic> json) {
    this.uid = json['id'].toString();
    this.name = json["name"].toString();
    this.email = json["email"].toString();
    this.photoUrl = json["image"].toString();
  }

  Person.user(User user) {
    this.uid = user.uid;
    this.name = user.displayName;
    this.email = user.email;
    this.photoUrl = user.photoURL;
  }

  Map<String, Object> toJson() {
    return {
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'photoUrl': this.photoUrl
    };
  }

  Person();

  //
}

import 'package:book_medial_mobile/constant/collectionNames.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/person.dart';

class DatabaseServices {
  final String uid;

  final userRef = FirebaseFirestore.instance
      .collection(USER)
      .withConverter<Person>(
          fromFirestore: (snaphsot, _) => Person.fromJson(snaphsot.data()),
          toFirestore: (person, _) => person.toJson());

  DatabaseServices({this.uid});
  Future<void> saveUser(User user) async {
    await userRef.doc(user.uid).set(Person.user(user), SetOptions(merge: true));
  }
}

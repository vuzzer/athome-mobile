import 'package:book_medial_mobile/constant/collectionNames.dart';
import 'package:book_medial_mobile/models/accommodation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccomodationServices {
  final accomodationRef = FirebaseFirestore.instance
      .collectionGroup(ACCOMMODATION)
      .withConverter<Accommodation>(
          fromFirestore: (snaphsot, _) =>
              Accommodation.fromJson(snaphsot.data()),
          toFirestore: (accommodation, _) => accommodation.toJson());

  Stream<List<Accommodation>> get accommodations {
    return accomodationRef.snapshots().map(_accommodationFromSnapshot);
  }

  List<Accommodation> _accommodationFromSnapshot(
      QuerySnapshot<Accommodation> snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  //Search an accommodation
  Future<List<Accommodation>> searchAccommodationFromSnapshotList(
      {String search}) async {
    print(search);
    return await accomodationRef
        .orderBy('villeResidence')
        .startAt([search])
        .get()
        .then(_accommodationFromSnapshot, onError: (error) => print(error));
  }
}

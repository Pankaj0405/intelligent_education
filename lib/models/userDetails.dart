import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String uid;
  String? photoUrl;

  UserDetails({
    required this.uid,
    required this.photoUrl
  });

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "photoUrl":photoUrl
  };
  static UserDetails fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserDetails(
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl']
    );
  }
}

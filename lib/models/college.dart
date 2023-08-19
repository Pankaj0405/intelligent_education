import 'package:cloud_firestore/cloud_firestore.dart';

class College {
  String collegeName;
  String address;

  College({
    required this.collegeName,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        "College Name": collegeName,
        "Address": address,
      };

  static College fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return College(
      collegeName: snapshot["College Name"],
      address: snapshot["Address"],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class College {
  String collegeName;
  String address;
  String id;

  College({
    required this.collegeName,
    required this.address,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        "College Name": collegeName,
        "Address": address,
        'id': id,
      };

  static College fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return College(
      collegeName: snapshot["College Name"],
      address: snapshot["Address"],
      id: snapshot['id'],
    );
  }
}

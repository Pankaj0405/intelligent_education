import 'package:cloud_firestore/cloud_firestore.dart';

class College {
  String collegeName;
  String address;
  String deadline;

  College({
    required this.collegeName,
    required this.deadline,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        "College Name": collegeName,
        "Address": address,
        "Deadline": deadline,
      };

  static College fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return College(
      collegeName: snapshot["College Name"],
      address: snapshot["Address"],
      deadline: snapshot["Deadline"],
    );
  }
}

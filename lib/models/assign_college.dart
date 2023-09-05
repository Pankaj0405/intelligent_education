import 'package:cloud_firestore/cloud_firestore.dart';

class AssignCollege {
  String college;
  String course;
  String status;
  String id;

  AssignCollege({
    required this.course,
    required this.college,
    required this.status,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    'college': college,
    'course': course,
    'status': status,
    'id': id,
  };

  static AssignCollege fromSnap(DocumentSnapshot snap) {
    var snapshotData = snap.data() as Map<String, dynamic>?;

    if (snapshotData == null) {
      // Handle the case where data is null or not as expected
      // You might return a default or throw an error, depending on your app's logic.
      throw Exception("Snapshot data is null or not as expected");
    }

    return AssignCollege(
      course: snapshotData['course'] ?? '', // Use default value if data is missing
      college: snapshotData['college'] ?? '', // Use default value if data is missing
      status: snapshotData['status'] ?? '', // Use default value if data is missing
      id: snapshotData['id'] ?? '', // Use default value if data is missing
    );
  }
}

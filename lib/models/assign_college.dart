import 'package:cloud_firestore/cloud_firestore.dart';

class AssignCollege {
  String college;
  String course;
  String deadline;

  AssignCollege({
    required this.course,
    required this.college,
    required this.deadline,
  });

  Map<String, dynamic> toJson() => {
    'college': college,
    'course': course,
    'deadline': deadline,
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
      deadline: snapshotData['deadline'] ?? '', // Use default value if data is missing
    );
  }
}

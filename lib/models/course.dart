import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String courseName;
  String collegeName;

  Course({
    required this.courseName,
    required this.collegeName,
  });

  Map<String, dynamic> toJson() => {
        "Course Name": courseName,
        "College Name": collegeName,
      };

  static Course fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Course(
        courseName: snapshot["Course Name"],
        collegeName: snapshot["College Name"]);
  }
}

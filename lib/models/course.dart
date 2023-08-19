import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String courseName;

  Course({
    required this.courseName,
  });

  Map<String, dynamic> toJson() => {
        "Course Name": courseName,
      };

  static Course fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Course(
        courseName: snapshot["Course Name"],);
  }
}

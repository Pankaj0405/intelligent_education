import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String courseName;
  String id;

  Course({
    required this.courseName,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        "Course Name": courseName,
    'id': id,
      };

  static Course fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Course(
        courseName: snapshot["Course Name"],
        id: snapshot['id'],
    );
  }
}

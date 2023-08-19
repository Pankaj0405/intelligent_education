import 'package:cloud_firestore/cloud_firestore.dart';

class AssignCollege {
  String student;
  String college;
  String course;
  String deadline;

  AssignCollege({
    required this.course,
    required this.college,
    required this.student,
    required this.deadline,
  });

  Map<String, dynamic> toJson() => {
        'Student': student,
        'College': college,
        'Course': course,
        'Deadline': deadline,
      };

  static AssignCollege fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AssignCollege(
        course: snapshot['Student'],
        college: snapshot['College'],
        student: snapshot['Course'],
        deadline: snapshot['Deadline'],
    );
  }
}

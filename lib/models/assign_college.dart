import 'package:cloud_firestore/cloud_firestore.dart';

class AssignCollege {
  String student;
  String college;
  String course;
  String deadline;
  String id;

  AssignCollege({
    required this.course,
    required this.college,
    required this.student,
    required this.deadline,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'Student': student,
        'College': college,
        'Course': course,
        'Deadline': deadline,
        'id': id,
      };

  static AssignCollege fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AssignCollege(
      course: snapshot['Student'],
      college: snapshot['College'],
      student: snapshot['Course'],
      deadline: snapshot['Deadline'],
      id: snapshot['id'],
    );
  }
}

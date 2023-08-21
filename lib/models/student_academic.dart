import 'package:cloud_firestore/cloud_firestore.dart';

class StudentAcademic {
  String instituteName;
  String country;
  String course;
  String level;
  String percentage;
  String fromDate;
  String toDate;
  String id;

  StudentAcademic({
    required this.course,
    required this.country,
    required this.fromDate,
    required this.instituteName,
    required this.level,
    required this.percentage,
    required this.toDate,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'Institute Name': instituteName,
        'Country': country,
        'Course': course,
        'Level of study': level,
        'Percentage/CGPA': percentage,
        'From': fromDate,
        'To': toDate,
        'id': id,
      };

  static StudentAcademic fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return StudentAcademic(
      id: snapshot['id'],
        course: snapshot['Course'],
        country: snapshot['Country'],
        fromDate: snapshot['From'],
        instituteName: snapshot['Institute Name'],
        level: snapshot['Level of study'],
        percentage: snapshot['Percentage/CGPA'],
        toDate: snapshot['To']);
  }
}

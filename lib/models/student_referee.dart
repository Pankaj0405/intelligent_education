import 'package:cloud_firestore/cloud_firestore.dart';

class StudentReferee {
  String refereeName;
  String relationship;
  String organization;
  String jobTitle;
  String workMail;
  String contactNo;
  String address;
  String id;

  StudentReferee({
    required this.refereeName,
    required this.address,
    required this.contactNo,
    required this.jobTitle,
    required this.organization,
    required this.relationship,
    required this.workMail,
    required this.id,
});

  Map<String, dynamic> toJson() => {
    'Referee Name': refereeName,
    'Relationship': relationship,
    'Organization': organization,
    'Job Title': jobTitle,
    'Work Email': workMail,
    'Contact No': contactNo,
    'Address': address,
    'id': id,
  };

  static StudentReferee fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return StudentReferee(
        refereeName: snapshot['Referee Name'],
        address: snapshot['Address'],
        contactNo: snapshot['Contact No'],
        jobTitle: snapshot['Job Title'],
        organization: snapshot['Organization'],
        relationship: snapshot['Relationship'],
        workMail: snapshot['Work Email'],
        id: snapshot['id'],
    );
  }

}
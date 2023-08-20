
import 'package:cloud_firestore/cloud_firestore.dart';

class Studentexperience{
  String organization;
  String address;
  String jobtitle;
  String contactno;
  String salary;
  String datefrom;
  String dateto;
  String id;
  Studentexperience({
    required this.organization,
    required this.address,
    required this.jobtitle,
    required this.contactno,
    required this.salary,
    required this.datefrom,
    required this.dateto,
    required this.id
  });
  Map<String, dynamic> toJson() => {
    'organization':organization,
    'address':address,
    'jobtitle':jobtitle,
    'contactno':contactno,
    'salary':salary,
    'datefrom':datefrom,
    'dateto':dateto,
    'id':id
  };

  static Studentexperience fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Studentexperience(
      id: snapshot['id'],
      organization: snapshot['organization'],
      address: snapshot['address'],
      jobtitle: snapshot['jobtitle'],
      contactno: snapshot['contactno'],
      salary:snapshot['salary'] ,
      datefrom:snapshot['datefrom'] ,
      dateto:snapshot['dateto'] ,
    );
  }
}
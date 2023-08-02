import 'package:cloud_firestore/cloud_firestore.dart';

class ParentInfo{
  String? id;
  String?uid;
  String? fathername;
  String? fatheroccupation;
  String?  mothername;
  String? motheroccupation;
  String? address;
  String? email;
  String? mobileno;
  ParentInfo({
    this.id,
    this.uid,
    this.fathername,
    this.fatheroccupation,
    this.mothername,
    this.motheroccupation,
    this.address,
    this.email,
    this.mobileno,
  });
  static ParentInfo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ParentInfo(
      id:snapshot['id'],
      uid:snapshot['uid'],
      fathername:snapshot['fathername'],
      fatheroccupation:snapshot['fatheroccupation'],
      mothername:snapshot['mothername'],
      motheroccupation:snapshot['motheroccupation'],
      address:snapshot['address'],
      email:snapshot['email'],
      mobileno:snapshot['mobileno'],
    );
  }
  ParentInfo.fromJson(Map<String,dynamic> json){
    id=json['id'];
    uid=json['uid'];
    fathername=json['fathername'];
    fatheroccupation=json['fatheroccupation'];
    mothername=json['mothername'];
    motheroccupation=json['motheroccupation'];
    address=json['address'];
    email=json['email'];
    mobileno=json['mobileno'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data =new Map<String,dynamic>();
    data['id']=this.id;
    data['uid']=this.uid;
    data['fathername']=this.fathername;
    data['fatheroccupation']=this.fatheroccupation;
    data['mothername']=this.mothername;
    data['motheroccupation']=this.motheroccupation;
    data['address']=this.address;
    data['email']=this.email;
    data['mobileno']=this.mobileno;
    return data;
  }


}
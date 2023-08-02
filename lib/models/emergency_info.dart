import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyInfo{
  String? id;
  String?uid;
  String? fullname;
  String?  gender;
  String? relationship;
  String? address;
  String? mobileno;

  EmergencyInfo({
    this.id,
    this.uid,
    this.fullname,
    this.gender,
    this.relationship,
    this.address,
    this.mobileno,
  });

  static EmergencyInfo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return EmergencyInfo(
      id:snapshot['id'],
      uid:snapshot['uid'],
      fullname:snapshot['fullname'],
      gender:snapshot['gender'],
      relationship:snapshot['relationship'],
      address:snapshot['address'],
      mobileno:snapshot['mobileno'],
    );
  }

  EmergencyInfo.fromJson(Map<String,dynamic> json){

    id=json['id'];
    uid=json['uid'];
    fullname=json['fullname'];
    gender=json['gender'];
    relationship=json['relationship'];
    address=json['address'];
    mobileno=json['mobileno'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data =new Map<String,dynamic>();
    data['id']=this.id;
    data['uid']=this.uid;
    data['fullname']=this.fullname;
    data['gender']=this.gender;
    data['relationship']=this.relationship;
    data['address']=this.address;
    data['mobileno']=this.mobileno;
    return data;
  }


}
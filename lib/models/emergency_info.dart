import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyInfo {
  String? id;
  String? uid;
  String? fullName;
  String? gender;
  String? relationship;
  String? address;
  String? mobileNo;

  EmergencyInfo({
    this.id,
    this.uid,
    this.fullName,
    this.gender,
    this.relationship,
    this.address,
    this.mobileNo,
  });

  static EmergencyInfo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return EmergencyInfo(
      id: snapshot['id'],
      uid: snapshot['uid'],
      fullName: snapshot['fullname'],
      gender: snapshot['gender'],
      relationship: snapshot['relationship'],
      address: snapshot['address'],
      mobileNo: snapshot['mobileno'],
    );
  }

  EmergencyInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    fullName = json['fullname'];
    gender = json['gender'];
    relationship = json['relationship'];
    address = json['address'];
    mobileNo = json['mobileno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['fullname'] = this.fullName;
    data['gender'] = this.gender;
    data['relationship'] = this.relationship;
    data['address'] = this.address;
    data['mobileno'] = this.mobileNo;
    return data;
  }
}

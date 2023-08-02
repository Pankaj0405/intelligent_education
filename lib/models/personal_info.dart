import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalInfo{
  String? id;
  String?uid;
  String? fullname;
  String? dateofbirth;
  String?  gender;
  String? nationality;
  String? currentaddress;
  String? permanentaddress;
  String? passportno;
  String? passportlocation;
  String? issuedate;
  String? expirydate;

  PersonalInfo({
    this.id,
    this.uid,
    this.fullname,
    this.dateofbirth,
    this.gender,
    this.nationality,
    this.currentaddress,
    this.permanentaddress,
    this.passportno,
    this.passportlocation,
    this.issuedate,
    this.expirydate,
  });

  static PersonalInfo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PersonalInfo(
      id:snapshot['id'],
      uid:snapshot['uid'],
      fullname:snapshot['fullname'],
      dateofbirth:snapshot['dateofbirth'],
      gender:snapshot['gender'],
      nationality:snapshot['nationality'],
      currentaddress:snapshot['currentaddress'],
      permanentaddress:snapshot['permanentaddress'],
      passportno:snapshot['passportno'],
      passportlocation:snapshot['passportlocation'],
      issuedate:snapshot['issuedate'],
      expirydate:snapshot['expirydate'],
    );
  }

  PersonalInfo.fromJson(Map<String,dynamic> json){

    id=json['id'];
    uid=json['uid'];
    fullname=json['fullname'];
    dateofbirth=json['dateofbirth'];
    gender=json['gender'];
    nationality=json['nationality'];
    currentaddress=json['currentaddress'];
    permanentaddress=json['permanentaddress'];
    passportno=json['passportno'];
    passportlocation=json['passportlocation'];
    issuedate=json['issuedate'];
    expirydate=json['expirydate'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data =new Map<String,dynamic>();
    data['id']=this.id;
    data['uid']=this.uid;
    data['fullname']=this.fullname;
    data['dateofbirth']=this.dateofbirth;
    data['gender']=this.gender;
    data['nationality']=this.nationality;
    data['currentaddress']=this.currentaddress;
    data['permanentaddress']=this.permanentaddress;
    data['passportno']=this.passportno;
    data['passportlocation']=this.passportlocation;
    data['issuedate']=this.issuedate;
    data['expirydate']=this.expirydate;
    return data;
  }


}
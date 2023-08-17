import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String phone;
  String email;
  String uid;
  String logintype;

  User(
      {required this.name,
      required this.phone,
      required this.email,
      required this.uid,
      required this.logintype});

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "uid": uid,
        "logintype": logintype
      };
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      name: snapshot['name'],
      phone: snapshot['phone'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      logintype: snapshot['logintype'],
    );
  }
}

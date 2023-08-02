import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intelligent_education/models/personal_info.dart' as personal;
import 'package:intelligent_education/models/parent_info.dart' as parent;
import 'package:intelligent_education/models/emergency_info.dart' as emergency;
import 'package:get/get.dart';
import 'package:intelligent_education/models/userDetails.dart';
import 'package:uuid/uuid.dart';

class InfoController extends GetxController {
  Rx<String?> profilePhotoget = Rx<String?>(null);
  var firebaseAuth = FirebaseAuth.instance;
  var firebaseStorage = FirebaseStorage.instance;
  var firestore = FirebaseFirestore.instance;
  @override
  void onReady() {
    // TODO: implement onReady
   getFirstPersonalInfo();
   getFirstParentInfo();
   getImage();
    super.onReady();
  }

  uploadPersonalInfo(
  String? fullname,
  String? dateofbirth,
  String?  gender,
  String? nationality,
  String? currentaddress,
  String? permanentaddress,
  String? passportno,
  String? passportlocation,
  String? issuedate,
  String? expirydate,) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
      await firestore.collection('users').doc(uid).get();
// get id
      String personalInfoId = Uuid().v1();
      personal.PersonalInfo personaladd=personal.PersonalInfo(
      id: personalInfoId,
        uid: uid,
        fullname: fullname,
        dateofbirth: dateofbirth,
        gender: gender,
        nationality: nationality,
        currentaddress: currentaddress,
        permanentaddress: permanentaddress,
        passportno: passportno,
        passportlocation: passportlocation,
        issuedate:  issuedate,
        expirydate: expirydate
      );


      await firestore.collection('userDetails').doc(uid).collection('personalInfo')
          .doc(personalInfoId).set(personaladd.toJson());
    } catch (e) {
      Get.snackbar('Error uploading Info', e.toString());
    }
  }
  Future<personal.PersonalInfo?> getFirstPersonalInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await firestore
          .collection('userDetails')
          .doc(uid)
          .collection('personalInfo')
          .get();

      if (snapshot.docs.isNotEmpty) {
        // If there are documents in the collection, get the first one
        DocumentSnapshot doc = snapshot.docs.first;
        print(doc);
        return personal.PersonalInfo.fromSnap(doc);
      } else {
        // If no documents are found, return null or handle as needed
        return null;
      }
    } catch (e) {
      Get.snackbar('Error getting Info', e.toString());
      return null;
    }
  }
  void uploadToStorage(File image) async {
    String uid = firebaseAuth.currentUser!.uid;
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask =  ref.putFile(image);
    TaskSnapshot snap=await uploadTask;
    String downloadUrl= await snap.ref.getDownloadURL();
    UserDetails userDetails1=UserDetails( uid: uid,photoUrl: downloadUrl);
    await firestore.collection('userDetails')
        .doc(uid).set(userDetails1.toJson());
  }
  getImage() async {
    DocumentSnapshot userDoc =
    await firestore.collection('userDetails').doc(firebaseAuth.currentUser!.uid).get();
    final userData = userDoc.data()! as dynamic;
    profilePhotoget.value= userData['photoUrl'];

  }
  uploadParentInfo(
  String? fathername,
  String? fatheroccupation,
  String?  mothername,
  String? motheroccupation,
  String? address,
  String? email,
  String? mobileno,) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
      await firestore.collection('users').doc(uid).get();
// get id
      String parentInfoId = Uuid().v1();
      parent.ParentInfo parentadd=parent.ParentInfo(
          id: parentInfoId,
          uid: uid,
        fathername: fathername,
        fatheroccupation: fatheroccupation,
        mothername: mothername,
        motheroccupation: motheroccupation,
        address: address,
        email: email,
        mobileno: mobileno);


      await firestore.collection('userDetails').doc(uid).collection('parentInfo')
          .doc(parentInfoId).set(parentadd.toJson());
    } catch (e) {
      Get.snackbar('Error uploading Info', e.toString());
    }
  }
  Future<parent.ParentInfo?> getFirstParentInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await firestore
          .collection('userDetails')
          .doc(uid)
          .collection('parentInfo')
          .get();

      if (snapshot.docs.isNotEmpty) {
        // If there are documents in the collection, get the first one
        DocumentSnapshot doc = snapshot.docs.first;
        print(doc);
        return parent.ParentInfo.fromSnap(doc);
      } else {
        // If no documents are found, return null or handle as needed
        return null;
      }
    } catch (e) {
      Get.snackbar('Error getting Info', e.toString());
      return null;
    }
  }
  uploadEmergencyInfo(
  String? fullname,
  String?  gender,
  String? relationship,
  String? address,
  String? mobileno,) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
      await firestore.collection('users').doc(uid).get();
// get id
      String emergencyInfoId = Uuid().v1();
      emergency.EmergencyInfo emergencyadd=emergency.EmergencyInfo(
          id: emergencyInfoId,
          uid: uid,
        fullname: fullname,
        gender: gender,
        relationship: relationship,
        address: address,
        mobileno: mobileno
      );


      await firestore.collection('userDetails').doc(uid).collection('emergencyInfo')
          .doc(emergencyInfoId).set(emergencyadd.toJson());
    } catch (e) {
      Get.snackbar('Error uploading Info', e.toString());
    }
  }
  Future<emergency.EmergencyInfo?> getFirstEmergencyInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await firestore
          .collection('userDetails')
          .doc(uid)
          .collection('emergencyInfo')
          .get();

      if (snapshot.docs.isNotEmpty) {
        // If there are documents in the collection, get the first one
        DocumentSnapshot doc = snapshot.docs.first;
        print(doc);
        return emergency.EmergencyInfo.fromSnap(doc);
      } else {
        // If no documents are found, return null or handle as needed
        return null;
      }
    } catch (e) {
      Get.snackbar('Error getting Info', e.toString());
      return null;
    }
  }
}

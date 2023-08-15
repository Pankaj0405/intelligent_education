import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/personal_info.dart' as personal;
import '../models/parent_info.dart' as parent;
import '../models/emergency_info.dart' as emergency;
import 'package:get/get.dart';
import '../models/userDetails.dart';
import 'package:uuid/uuid.dart';

class InfoController extends GetxController {
  Rx<String?> profilePhotoGet = Rx<String?>(null);
  var firebaseAuth = FirebaseAuth.instance;
  var firebaseStorage = FirebaseStorage.instance;
  var fireStore = FirebaseFirestore.instance;
  @override
  void onReady() {
    // TODO: implement onReady
    getFirstPersonalInfo();
    getFirstParentInfo();
    getImage();
    super.onReady();
  }

  uploadPersonalInfo(
    String? fullName,
    String? dateOfBirth,
    String? gender,
    String? nationality,
    String? currentAddress,
    String? permanentAddress,
    String? passportNo,
    String? passportLocation,
    String? issueDate,
    String? expiryDate,
  ) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
          await fireStore.collection('users').doc(uid).get();
// get id
      String personalInfoId = const Uuid().v1();
      personal.PersonalInfo personalAdd = personal.PersonalInfo(
          id: personalInfoId,
          uid: uid,
          fullname: fullName,
          dateofbirth: dateOfBirth,
          gender: gender,
          nationality: nationality,
          currentaddress: currentAddress,
          permanentaddress: permanentAddress,
          passportno: passportNo,
          passportlocation: passportLocation,
          issuedate: issueDate,
          expirydate: expiryDate);

      await fireStore
          .collection('userDetails')
          .doc(uid)
          .collection('personalInfo')
          .doc(personalInfoId)
          .set(personalAdd.toJson());
    } catch (e) {
      Get.snackbar('Error uploading Info', e.toString());
    }
  }

  Future<personal.PersonalInfo?> getFirstPersonalInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await fireStore
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

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    UserDetails userDetails1 = UserDetails(uid: uid, photoUrl: downloadUrl);
    await fireStore
        .collection('userDetails')
        .doc(uid)
        .set(userDetails1.toJson());
  }

  getImage() async {
    DocumentSnapshot userDoc = await fireStore
        .collection('userDetails')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    final userData = userDoc.data()! as dynamic;
    profilePhotoGet.value = userData['photoUrl'];
  }

  uploadParentInfo(
    String? fatherName,
    String? fatherOccupation,
    String? motherName,
    String? motherOccupation,
    String? address,
    String? email,
    String? mobileNo,
  ) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
          await fireStore.collection('users').doc(uid).get();
// get id
      String parentInfoId = const Uuid().v1();
      parent.ParentInfo parentAdd = parent.ParentInfo(
          id: parentInfoId,
          uid: uid,
          fathername: fatherName,
          fatheroccupation: fatherOccupation,
          mothername: motherName,
          motheroccupation: motherOccupation,
          address: address,
          email: email,
          mobileno: mobileNo);

      await fireStore
          .collection('userDetails')
          .doc(uid)
          .collection('parentInfo')
          .doc(parentInfoId)
          .set(parentAdd.toJson());
    } catch (e) {
      Get.snackbar('Error uploading Info', e.toString());
    }
  }

  Future<parent.ParentInfo?> getFirstParentInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await fireStore
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
    String? fullName,
    String? gender,
    String? relationship,
    String? address,
    String? mobileNo,
  ) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
          await fireStore.collection('users').doc(uid).get();
// get id
      String emergencyInfoId = const Uuid().v1();
      emergency.EmergencyInfo emergencyAdd = emergency.EmergencyInfo(
          id: emergencyInfoId,
          uid: uid,
          fullname: fullName,
          gender: gender,
          relationship: relationship,
          address: address,
          mobileno: mobileNo);

      await fireStore
          .collection('userDetails')
          .doc(uid)
          .collection('emergencyInfo')
          .doc(emergencyInfoId)
          .set(emergencyAdd.toJson());
    } catch (e) {
      Get.snackbar('Error uploading Info', e.toString());
    }
  }

  Future<emergency.EmergencyInfo?> getFirstEmergencyInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await fireStore
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

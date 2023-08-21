import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intelligent_education/Student/student_experience.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/models/student_academic.dart';
import 'package:intelligent_education/models/student_experience.dart';
import 'package:intelligent_education/models/student_referee.dart';
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
  final Rx<List<Studentexperience>> _experiences =
      Rx<List<Studentexperience>>([]);
  List<Studentexperience> get experiences => _experiences.value;
  final Rx<List<StudentReferee>> _referee = Rx<List<StudentReferee>>([]);
  List<StudentReferee> get referee => _referee.value;
  final Rx<List<StudentAcademic>> _academics = Rx<List<StudentAcademic>>([]);
  List<StudentAcademic> get academics => _academics.value;

  // String _experienceId = "";
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
          fullName: fullName,
          gender: gender,
          relationship: relationship,
          address: address,
          mobileNo: mobileNo);

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

  getExperience() async {
    _experiences.bindStream(firestore
        .collection('userDetails')
        .doc(authController.user.uid)
        .collection('experienceInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Studentexperience> retValue = [];
      for (var element in query.docs) {
        retValue.add(Studentexperience.fromSnap(element));
      }
      return retValue;
    }));
  }

  postExperience(String organization, String address, String jobtitle,
      String contactno, String salary, String datefrom, String dateto) async {
    try {
      String experienceInfoId = const Uuid().v1();
      Studentexperience experience = Studentexperience(
          id: experienceInfoId,
          organization: organization,
          address: address,
          jobtitle: jobtitle,
          contactno: contactno,
          salary: salary,
          datefrom: datefrom,
          dateto: dateto);

      await firestore
          .collection('userDetails')
          .doc(authController.user.uid)
          .collection('experienceInfo')
          .doc(experienceInfoId)
          .set(experience.toJson());
    } catch (e) {
      Get.snackbar('Error While Commenting', e.toString());
    }
  }

  getReferee() async {
    _referee.bindStream(firestore
        .collection('userDetails')
        .doc(authController.user.uid)
        .collection('refereeInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<StudentReferee> retValue = [];
      for (var element in query.docs) {
        retValue.add(StudentReferee.fromSnap(element));
      }
      return retValue;
    }));
  }

  postReferee(
      String refereeName,
      String address,
      String contactNo,
      String jobTitle,
      String organization,
      String relationship,
      String workMail) async {
    try {
      String refereeInfoId = const Uuid().v1();
      StudentReferee referee = StudentReferee(
          refereeName: refereeName,
          address: address,
          contactNo: contactNo,
          jobTitle: jobTitle,
          organization: organization,
          relationship: relationship,
          workMail: workMail,
          id: refereeInfoId);
      await firestore
          .collection('userDetails')
          .doc(authController.user.uid)
          .collection('refereeInfo')
          .doc(refereeInfoId)
          .set(referee.toJson());
    } catch (e) {
      Get.snackbar('Error While Commenting', e.toString());
    }
  }

  getAcademics() async {
    _academics.bindStream(firestore
        .collection('userDetails')
        .doc(authController.user.uid)
        .collection('academicInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<StudentAcademic> retValue = [];
      for (var element in query.docs) {
        retValue.add(StudentAcademic.fromSnap(element));
      }
      return retValue;
    }));
  }

  postAcademics(String instituteName, String country, String course,
      String level, String percentage, String fromDate, String toDate) async {
    try {
      String academicInfoId = const Uuid().v1();
      StudentAcademic academic = StudentAcademic(
          course: course,
          country: country,
          fromDate: fromDate,
          instituteName: instituteName,
          level: level,
          percentage: percentage,
          toDate: toDate,
          id: academicInfoId
          );
      await firestore
          .collection('userDetails')
          .doc(authController.user.uid)
          .collection('academicInfo')
          .doc(academicInfoId)
          .set(academic.toJson());
    } catch (e) {
      Get.snackbar('Error While Commenting', e.toString());
    }
  }
}

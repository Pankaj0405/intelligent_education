import 'dart:io';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/models/documentDetails.dart';
import 'package:intelligent_education/models/student_academic.dart';
import 'package:intelligent_education/models/student_experience.dart';
import 'package:intelligent_education/models/student_referee.dart';
import '../models/personal_info.dart' as personal;
import '../models/parent_info.dart' as parent;
import '../models/emergency_info.dart' as emergency;
import 'package:get/get.dart';
import '../models/userDetails.dart';
import 'package:uuid/uuid.dart';
import '../models/college.dart';

class InfoController extends GetxController {
  Rx<String?> profilePhotoGet = Rx<String?>(null);
  var firebaseAuth = FirebaseAuth.instance;
  var firebaseStorage = FirebaseStorage.instance;
  var fireStore = FirebaseFirestore.instance;
  final Rx<List<Studentexperience>> _experiences =
      Rx<List<Studentexperience>>([]);
  List<Studentexperience> get experiences => _experiences.value;
  final Rx<List<DocumentDetails>> _documents =
  Rx<List<DocumentDetails>>([]);
  List<DocumentDetails> get documents => _documents.value;
  final Rx<List<StudentReferee>> _referee = Rx<List<StudentReferee>>([]);
  List<StudentReferee> get referee => _referee.value;
  final Rx<List<StudentAcademic>> _academics = Rx<List<StudentAcademic>>([]);
  List<StudentAcademic> get academics => _academics.value;
  final Rx<List<personal.PersonalInfo>> _personalInfo =
      Rx<List<personal.PersonalInfo>>([]);
  List<personal.PersonalInfo> get personalInfo => _personalInfo.value;
  final Rx<List<parent.ParentInfo>> _parentInfo =
      Rx<List<parent.ParentInfo>>([]);
  List<parent.ParentInfo> get parentInfo => _parentInfo.value;
  final Rx<List<emergency.EmergencyInfo>> _emergencyInfo =
      Rx<List<emergency.EmergencyInfo>>([]);
  List<emergency.EmergencyInfo> get emergencyInfo => _emergencyInfo.value;

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

  Future<void> uploadDocument(File image,String name) async {
    String uid = firebaseAuth.currentUser!.uid;
    String documentInfoId = const Uuid().v1();
    Reference ref = firebaseStorage
        .ref()
        .child('Documents')
        .child(documentInfoId);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    DocumentDetails docDetails1 = DocumentDetails( docName: name, docUrl: downloadUrl);
    await fireStore
        .collection('userDetails')
        .doc(uid)
    .collection('documentInfo').doc(documentInfoId).set(docDetails1.toJson());
  }
  getDocuments() async {
    _documents.bindStream(firestore
        .collection('userDetails')
        .doc(authController.user.uid)
        .collection('documentInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<DocumentDetails> retValue = [];
      for (var element in query.docs) {
        retValue.add(DocumentDetails.fromSnap(element));
      }
      return retValue;
    }));
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

  getExperienceForAdmin(String id) async {
    _experiences.bindStream(firestore
        .collection('userDetails')
        .doc(id)
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

  Future<void> updateExperience(
      String organization,
      String address,
      String jobTitle,
      String contactNo,
      String salary,
      String fromDate,
      String toDate,
      String userId,
      String cardId) async {
    try {
      if (organization.isNotEmpty &&
          address.isNotEmpty &&
          jobTitle.isNotEmpty &&
          contactNo.isNotEmpty &&
          salary.isNotEmpty &&
          fromDate.isNotEmpty &&
          toDate.isNotEmpty) {
        await firestore
            .collection('userDetails')
            .doc(userId)
            .collection('experienceInfo')
            .doc(cardId)
            .update({
          'organization': organization,
          'address': address,
          'jobtitle': jobTitle,
          'contactno': contactNo,
          'salary': salary,
          'datefrom': fromDate,
          'dateto': toDate,
        });
        Get.snackbar(
            'Alert Message', 'Experience details updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating experience details', e.toString());
    }
  }

  Future<void> deleteExperience(String userId, String cardId) async {
    try {
      await firestore
          .collection('userDetails')
          .doc(userId)
          .collection('experienceInfo')
          .doc(cardId)
          .delete();
      Get.snackbar('Alert Message', 'Experience details deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting experience details', e.toString());
      print(e.toString());
    }
  }

  getPersonalInfo(String id) async {
    _personalInfo.bindStream(firestore
        .collection('userDetails')
        .doc(id)
        .collection('personalInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<personal.PersonalInfo> retValue = [];
      for (var element in query.docs) {
        retValue.add(personal.PersonalInfo.fromSnap(element));
      }
      return retValue;
    }));
  }

  Future<void> updatePersonalInfo(
      String newName,
      String newDOB,
      String newGender,
      String newNationality,
      String currentAddress,
      String permanentAddress,
      String passportNo,
      String passportLocation,
      String issueDate,
      String expiryDate,
      String userId,
      String cardId) async {
    try {
      if (newName.isNotEmpty &&
          newGender.isNotEmpty &&
          newDOB.isNotEmpty &&
          newNationality.isNotEmpty &&
          currentAddress.isNotEmpty &&
          permanentAddress.isNotEmpty &&
          passportNo.isNotEmpty &&
          passportLocation.isNotEmpty &&
          issueDate.isNotEmpty &&
          expiryDate.isNotEmpty) {
        await firestore
            .collection('userDetails')
            .doc(userId)
            .collection('personalInfo')
            .doc(cardId)
            .update({
          'fullname': newName,
          'dateofbirth': newDOB,
          'gender': newGender,
          'nationality': newNationality,
          'currentaddress': currentAddress,
          'permanentaddress': permanentAddress,
          'passportno': passportNo,
          'passportlocation': passportLocation,
          'issuedate': issueDate,
          'expirydate': expiryDate,
        });
        Get.snackbar('Alert Message', 'Personal details updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating personal details', e.toString());
    }
  }

  Future<void> deletePersonalInfo(String userId, String cardId) async {
    try {
      await firestore
          .collection('userDetails')
          .doc(userId)
          .collection('personalInfo')
          .doc(cardId)
          .delete();
      Get.snackbar('Alert Message', 'Personal details deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting personal details', e.toString());
      print(e.toString());
    }
  }

  getParentInfo(String id) async {
    _parentInfo.bindStream(firestore
        .collection('userDetails')
        .doc(id)
        .collection('parentInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<parent.ParentInfo> retValue = [];
      for (var element in query.docs) {
        retValue.add(parent.ParentInfo.fromSnap(element));
      }
      return retValue;
    }));
  }

  Future<void> updateParentInfo(
      String newFatherName,
      String newFatherOccupation,
      String newMotherName,
      String newMotherOccupation,
      String address,
      String email,
      String mobileNo,
      String userId,
      String cardId) async {
    try {
      if (newFatherName.isNotEmpty &&
          newFatherOccupation.isNotEmpty &&
          newMotherName.isNotEmpty &&
          newMotherOccupation.isNotEmpty &&
          address.isNotEmpty &&
          email.isNotEmpty &&
          mobileNo.isNotEmpty
          ) {
        await firestore
            .collection('userDetails')
            .doc(userId)
            .collection('parentInfo')
            .doc(cardId)
            .update({
          'fathername': newFatherName,
          'fatheroccupation': newFatherOccupation,
          'mothername': newMotherName,
          'motheroccupation': newMotherOccupation,
          'address': address,
          'email': email,
          'mobileno': mobileNo,
        });
        Get.snackbar('Alert Message', 'Parents\' details updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating parents\' details', e.toString());
    }
  }

  Future<void> deleteParentInfo(String userId, String cardId) async {
    try {
      await firestore
          .collection('userDetails')
          .doc(userId)
          .collection('parentInfo')
          .doc(cardId)
          .delete();
      Get.snackbar('Alert Message', 'Parents\' details deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting parents\' details', e.toString());
      print(e.toString());
    }
  }

  getEmergencyInfo(String id) async {
    _emergencyInfo.bindStream(firestore
        .collection('userDetails')
        .doc(id)
        .collection('emergencyInfo')
        .snapshots()
        .map((QuerySnapshot query) {
      List<emergency.EmergencyInfo> retValue = [];
      for (var element in query.docs) {
        retValue.add(emergency.EmergencyInfo.fromSnap(element));
      }
      return retValue;
    }));
  }

  Future<void> updateEmergencyInfo(
      String newGuardianName,
      String gender,
      String relationship,
      String address,
      String mobileNo,
      String userId,
      String cardId) async {
    try {
      if (newGuardianName.isNotEmpty &&
          gender.isNotEmpty &&
          relationship.isNotEmpty &&
          address.isNotEmpty &&
          mobileNo.isNotEmpty
      ) {
        await firestore
            .collection('userDetails')
            .doc(userId)
            .collection('emergencyInfo')
            .doc(cardId)
            .update({
          'fullname': newGuardianName,
          'gender': gender,
          'relationship': relationship,
          'address': address,
          'mobileno': mobileNo,
        });
        Get.snackbar('Alert Message', 'Emergency details updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating emergency details', e.toString());
    }
  }

  Future<void> deleteEmergencyInfo(String userId, String cardId) async {
    try {
      await firestore
          .collection('userDetails')
          .doc(userId)
          .collection('emergencyInfo')
          .doc(cardId)
          .delete();
      Get.snackbar('Alert Message', 'Emergency details deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting emergency details', e.toString());
      print(e.toString());
    }
  }

  getAcademicsForAdmin(String id) async {
    _academics.bindStream(firestore
        .collection('userDetails')
        .doc(id)
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

  Future<void> updateAcademics(
      String instituteName,
      String country,
      String course,
      String level,
      String percentage,
      String fromDate,
      String toDate,
      String userId,
      String cardId) async {
    try {
      if (instituteName.isNotEmpty &&
          country.isNotEmpty &&
          course.isNotEmpty &&
          level.isNotEmpty &&
          percentage.isNotEmpty &&
          fromDate.isNotEmpty &&
          toDate.isNotEmpty) {
        await firestore
            .collection('userDetails')
            .doc(userId)
            .collection('academicInfo')
            .doc(cardId)
            .update({
          'Institute Name': instituteName,
          'Country': country,
          'Course': course,
          'Level of study': level,
          'Percentage/CGPA': percentage,
          'From': fromDate,
          'To': toDate,
        });
        Get.snackbar(
            'Alert Message', 'Academics details updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating academics details', e.toString());
    }
  }

  Future<void> deleteAcademics(String userId, String cardId) async {
    try {
      await firestore
          .collection('userDetails')
          .doc(userId)
          .collection('academicInfo')
          .doc(cardId)
          .delete();
      Get.snackbar('Alert Message', 'Academic details deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting academic details', e.toString());
      print(e.toString());
    }
  }

  getRefereeForAdmin(String id) async {
    _referee.bindStream(firestore
        .collection('userDetails')
        .doc(id)
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

  Future<void> updateReferee(
      String refereeName,
      String relationship,
      String organization,
      String jobTitle,
      String workMail,
      String contactNo,
      String address,
      String userId,
      String cardId) async {
    try {
      if (refereeName.isNotEmpty &&
          relationship.isNotEmpty &&
          organization.isNotEmpty &&
          jobTitle.isNotEmpty &&
          workMail.isNotEmpty &&
          contactNo.isNotEmpty &&
          address.isNotEmpty) {
        await firestore
            .collection('userDetails')
            .doc(userId)
            .collection('refereeInfo')
            .doc(cardId)
            .update({
          'Referee Name': refereeName,
          'Relationship': relationship,
          'Organization': organization,
          'Job Title': jobTitle,
          'Work Email': workMail,
          'Contact No': contactNo,
          'Address': address,
        });
        Get.snackbar(
            'Alert Message', 'Referee details updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating referee details', e.toString());
    }
  }

  Future<void> deleteReferee(String userId, String cardId) async {
    try {
      await firestore
          .collection('userDetails')
          .doc(userId)
          .collection('refereeInfo')
          .doc(cardId)
          .delete();
      Get.snackbar('Alert Message', 'Referee details deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting referee details', e.toString());
      print(e.toString());
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
          id: academicInfoId);
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

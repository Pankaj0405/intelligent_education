import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/models/assign_college.dart';
import 'package:intelligent_education/models/college.dart';
import 'package:uuid/uuid.dart';
import '../Admin/admin_dash.dart';
import '../Student/student_dashboard.dart';
import '../constants.dart';
import '../login_screen.dart';
import '../models/course.dart';
import '../models/deadline.dart';
import '../models/user.dart' as model;
import '../models/college.dart' as college_model;
import '../models/course.dart' as course_model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<String?> loginType1 = Rx<String?>(null);
  Rx<String?> name = Rx<String?>(null);
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;
  final Rx<List<College>> _college = Rx<List<College>>([]);
  List<College> get college => _college.value;
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> deadlinesData =
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>>();
  final Rx<List<Course>> _course = Rx<List<Course>>([]);
  List<Course> get course => _course.value;
  RxList<QueryDocumentSnapshot> notifications = <QueryDocumentSnapshot>[].obs;
final Rx<List<model.User>> _searchUsers = Rx<List<model.User>>([]);
  List<model.User> get searchUsers => _searchUsers.value;
  final Rx<List<model.User>> _userData = Rx<List<model.User>>([]);
  List<model.User> get userData => _userData.value;
  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;
  final RxList<AssignCollege> _assignedColleges = RxList<AssignCollege>([]);
  List<AssignCollege> get assignedColleges => _assignedColleges.value;
  final Rx<List<Deadline>> _deadlines = Rx<List<Deadline>>([]);
  List<Deadline> get deadlines => _deadlines.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getNotification();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, setInitialScreen);

  }

  setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      setScreen();
      getUserData();
    }
  }

  // Inside your AuthController class
  Future<void> updateUserCollegeAndCourseInSubcollection(String userId, String collegeName, String courseName,String status, String deadline, List<TextEditingController> controllers) async {
    try {
      final id = const Uuid().v1();
      final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
      if(deadline.isNotEmpty && collegeName.isNotEmpty && courseName.isNotEmpty) {
        await userRef.collection('college_assign').doc(id).set({
          'college': collegeName,
          'course': courseName,
          'status': status,
          'id': id,
        });
        final deadlineId = const Uuid().v1();
        await userRef.collection('college_assign').doc(id).collection('deadlines').doc(deadlineId).set({
          'deadline': deadline,
          'id': deadlineId,
        });
        int n = 1;
          for(final deadlines in controllers) {
            final deadlineId = const Uuid().v1();
            await userRef.collection('college_assign').doc(id).collection('deadlines').doc(deadlineId).set({
              'deadline': deadlines.text,
              'id': deadlineId,
            });
            n++;
        }

        Get.snackbar('Alert Message', 'College assigned successfully');
      }
       print('User subcollection updated successfully');
    } catch (error) {
       print('Error updating user subcollection: $error');
      Get.snackbar('Error', 'Enter all the fields');
    }
  }

  void fetchAssignedColleges() async {
    try {
      _assignedColleges.bindStream(
          firestore.collection('users').doc(firebaseAuth.currentUser!.uid).collection('college_assign').snapshots().map((QuerySnapshot query) {
            List<AssignCollege> retValue = [];
            for (var element in query.docs) {
              retValue.add(AssignCollege.fromSnap(element));
            }
            print("Fetched data: ${retValue.toString()}");
            return retValue;
          }));
    } catch (e) {
      print("Error fetching assigned colleges: $e");
    }
  }

  getAssignedColleges(String id) async {
    try {
      _assignedColleges.bindStream(
          firestore.collection('users').doc(id).collection('college_assign').snapshots().map((QuerySnapshot query) {

            List<AssignCollege> retValue = [];
            for (var element in query.docs) {
              retValue.add(AssignCollege.fromSnap(element));
            }
            print("Fetched data: ${retValue.toString()}");
            return retValue;
          }));
    } catch (e) {
      print("Error fetching assigned colleges: $e");
    }
  }

  Future<void> fetchdeadlinesData(String uid,String docid) async {
    final querySnapshot = await firestore.collection('users').doc(uid).collection('college_assign').doc(docid).collection('deadlines').get();
    deadlinesData.assignAll(querySnapshot.docs);
    // ... your existing logic
  }

  getDeadlines(String userId, String docId) async {
    try {
      _deadlines.bindStream(
          firestore.collection('users').doc(userId).collection('college_assign').doc(docId).collection('deadlines').snapshots().map((QuerySnapshot query) {

            List<Deadline> retValue = [];
            for (var element in query.docs) {
              retValue.add(Deadline.fromSnap(element));
            }
            print("Fetched data: ${retValue.toString()}");
            return retValue;
          }));
    } catch (e) {
      print("Error fetching assigned colleges: $e");
    }
      // final QuerySnapshot deadlinesList =await  firestore.collection('users').doc(userId).collection('college_assign').doc(docId).collection('deadlines').get();
      //   List<Deadline> deadlines = deadlinesList.docs
      //       .map((documentSnapshot) => Deadline.fromSnap(documentSnapshot))
      //       .toList();
      //   return deadlines;
  }

  Future<void> updateDeadlines(String deadline, String userId, String docId, String deadlineId) async {
    try{
      await firestore.collection('users').doc(userId).collection('college_assign').doc(docId).collection('deadlines').doc(deadlineId).update({
        'deadline': deadline,
      });
      Get.snackbar('Alert Message', 'Deadline updated successfully');
    } catch (e) {
      Get.snackbar('Error updating deadline', e.toString());
    }
  }

  Future<void> deleteDeadlines(String userId, String docId, String deadlineId) async {
    try{
      await firestore.collection('users').doc(userId).collection('college_assign').doc(docId).collection('deadlines').doc(deadlineId).delete();
      Get.snackbar('Alert Message', 'Deadline updated successfully');
    } catch (e) {
      Get.snackbar('Error updating deadline', e.toString());
    }
  }

  Future<void> updateAssignedCollege(String status, String uid, String docId) async {
    try{
        await firestore.collection('users').doc(uid).collection('college_assign').doc(docId).update({
          'status': status,
        });
        Get.snackbar('Alert Message', 'College assigned updated successfully');
    } catch (e) {
      Get.snackbar('Error updating assigned college', e.toString());
    }
  }

  Future<void> deleteAssignedCollege(String uid, String docId) async {
    try {
      await firestore.collection('users').doc(uid).collection('college_assign').doc(docId).delete();
      Get.snackbar('Alert Message', 'College assigned deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting assigned college', e.toString());
      print(e.toString());
    }
  }

  Future<List<College>> getAllColleges() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('colleges').get();

    List<College> colleges = querySnapshot.docs
        .map((documentSnapshot) => College.fromSnap(documentSnapshot))
        .toList();
    print('Fetched colleges: $colleges');
    return colleges;
  }

  Future<List<Course>> getAllCourses() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('courses').get();

    List<Course> courses = querySnapshot.docs
        .map((documentSnapshot) => Course.fromSnap(documentSnapshot))
        .toList();

    print('Fetched courses: $courses');
    return courses;
  }

  Future<List<model.User>> getAllStudents() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('users')
        .where('logintype', isEqualTo: 'Student')
        .get();

    List<model.User> students = querySnapshot.docs
        .map((documentSnapshot) => model.User.fromSnap(documentSnapshot))
        .toList();

    print('Fetched students: $students');
    return students;
  }

  searchUser(String typedUser) async {
    if(typedUser == "") {
      _searchUsers.bindStream(firestore.collection('users').where(
          'logintype',isEqualTo: 'Student').snapshots().map((QuerySnapshot query) {
        List<model.User> retValue = [];
        for (var element in query.docs) {
          retValue.add(model.User.fromSnap(element));
        }
        return retValue;
      }));
    } else {
      _searchUsers.bindStream(firestore.collection('users').where(
          'logintype',isEqualTo: 'Student').where('name', isGreaterThanOrEqualTo: typedUser).where('name', isLessThan: '${typedUser}z').snapshots().map((QuerySnapshot query) {
        List<model.User> retValue = [];
        for (var element in query.docs) {
          retValue.add(model.User.fromSnap(element));
        }
        return retValue;
      }));
    }

  }

  //register user
  void registerUser(String username, String phone, String email,
      String password, String loginType) async {
    FirebaseApp secondaryApp = await Firebase.initializeApp(
      name: 'SecondaryApp',
      options: Firebase.app().options,
    );
    try {
      if (username.isNotEmpty &&
          phone.isNotEmpty &&
          email.isNotEmpty &&
          loginType.isNotEmpty &&
          password.isNotEmpty) {
        // save a user
        UserCredential cred = await FirebaseAuth.instanceFor(app: secondaryApp)
            .createUserWithEmailAndPassword(email: email, password: password);

        model.User user = model.User(
            name: username,
            phone: phone,
            email: email,
            uid: cred.user!.uid,
            logintype: loginType);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        Get.snackbar('Alert Message', 'User successfully created');
      } else {
        Get.snackbar('Error creating Account', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error creating an Account', e.toString());
      print(e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('log success');
      } else {
        Get.snackbar('Error Logging in', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error logging in', e.toString());
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  resetPassword(String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        Get.snackbar('Reset Password',
            'We have sent you an email to recover password, please check email!');
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  getUserData() async {
    DocumentSnapshot userDoc = await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    final userData = userDoc.data()! as dynamic;
    name.value = userData['name'];
    // setInitialScreen(firebaseAuth.currentUser);
  }

  setScreen() async {
    DocumentSnapshot userDoc = await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    final userData = userDoc.data()! as dynamic;
    loginType1.value = userData['logintype'];
    if (loginType1.value == 'Student') {
      Get.to(() => const StudentDashboard());
    } else {
      Get.to(() => const AdminDash());
    }
  }
  
  getUser() async {
    _userData.bindStream(firestore.collection('users').snapshots().map((QuerySnapshot query) {
      List<model.User> retValue = [];
      for (var element in query.docs) {
        retValue.add(model.User.fromSnap(element));
      }
      return retValue;
    }));
  }

  Future<void> updateUser(String newName, String newEmail, String newPhone, String userId) async {
    try{
      if(newName.isNotEmpty && newEmail.isNotEmpty && newPhone.isNotEmpty) {
        await firestore.collection('users').doc(userId).update({
          'name': newName,
          'phone': newPhone,
          'email': newEmail,
        });
        Get.snackbar('Alert Message', 'User updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating User', e.toString());
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await firestore.collection('users').doc(userId).delete();

      Get.snackbar('Alert Message', 'User deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting User', e.toString());
      print(e.toString());
    }
  }

  void registerCollege(String collegeName, String address) async {
    try {
      String collegeId = const Uuid().v1();
      if (collegeName.isNotEmpty && address.isNotEmpty) {
        college_model.College college = college_model.College(
            collegeName: collegeName, address: address, id: collegeId);
        await firestore
            .collection('colleges')
            .doc(collegeId)
            .set(college.toJson());
        Get.snackbar('Alert Message', 'College added successfully');
      } else {
        Get.snackbar('Error adding College', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error adding College', e.toString());
      print(e.toString());
    }
  }

  getCollege() async {
    _college.bindStream(
        firestore.collection('colleges').snapshots().map((QuerySnapshot query) {
      List<College> retValue = [];
      for (var element in query.docs) {
        retValue.add(College.fromSnap(element));
      }
      return retValue;
    }));
  }

  Future<void> updateCollege(
      String collegeId, String newCollegeName, String newAddress) async {
    try {
      if(newCollegeName.isNotEmpty && newAddress.isNotEmpty) {
        await firestore.collection('colleges').doc(collegeId).update({
          'College Name': newCollegeName,
          'Address': newAddress,
        });
        Get.snackbar('Alert Message', 'College updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating College', e.toString());
      print(e.toString());
    }
  }

  Future<void> deleteCollege(String collegeId) async {
    try {
      await firestore.collection('colleges').doc(collegeId).delete();
      Get.snackbar('Alert Message', 'College deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting College', e.toString());
      print(e.toString());
    }
  }

  void registerCourse(String courseName) async {
    try {
      String courseId = const Uuid().v1();
      if (courseName.isNotEmpty) {
        course_model.Course course =
            course_model.Course(courseName: courseName, id: courseId);
        await firestore
            .collection('courses')
            .doc(courseId)
            .set(course.toJson());
        Get.snackbar('Alert Message', 'Course added successfully');
      } else {
        Get.snackbar('Error adding Course', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error adding Course', e.toString());
      print(e.toString());
    }
  }

  getCourse() async {
    _course.bindStream(
        firestore.collection('courses').snapshots().map((QuerySnapshot query) {
      List<Course> retValue = [];
      for (var element in query.docs) {
        retValue.add(Course.fromSnap(element));
      }
      return retValue;
    }));
  }

  Future<void> updateCourse(String courseId, String newCourseName) async {
    try{
      if(newCourseName.isNotEmpty) {
        await firestore.collection('courses').doc(courseId).update({
          'Course Name': newCourseName,
        });
        Get.snackbar('Alert Message', 'Course updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error updating Course', e.toString());
    }
  }

  Future<void> deleteCourse(String courseId) async {
    try {
      await firestore.collection('courses').doc(courseId).delete();
      Get.snackbar('Alert Message', 'Course deleted successfully');
    } catch (e) {
      Get.snackbar('Error deleting Course', e.toString());
      print(e.toString());
    }
  }

  void sendNotification(String title,String message) async {
    try {
      // String notificationId = const Uuid().v1();
      if (title.isNotEmpty && message.isNotEmpty) {
        CollectionReference notifications =
        FirebaseFirestore.instance.collection('notifications');

        await notifications.add({
          'title': title,
          'body': message,
          'scheduledTime': DateTime.now().toString(), // Store the scheduled time
          'timestamp': FieldValue.serverTimestamp(),
        });
        Get.snackbar('Alert Message', 'Notification sent successfully');
      } else {
        Get.snackbar(
            'Error sending Notification', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error sending Notification', e.toString());
      print(e.toString());
    }
  }

  getNotification() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .orderBy('timestamp',
          descending: true)
          .get();
      notifications.assignAll(snapshot.docs);
    } catch (e) {
      print('Error fetching notifications: $e');
    }
  }
}

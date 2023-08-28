import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/models/assign_college.dart';
import 'package:intelligent_education/models/college.dart';
import 'package:uuid/uuid.dart';
import '../Admin/admin_dash.dart';
import '../Student/student_dashboard.dart';
import '../constants.dart';
import '../login_screen.dart';
import '../models/course.dart';
import '../models/notification.dart';
import '../models/user.dart' as model;
import '../models/college.dart' as college_model;
import '../models/course.dart' as course_model;
import '../models/notification.dart' as notification_model;


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<String?> loginType1 = Rx<String?>(null);
  Rx<String?> name = Rx<String?>(null);
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;
  final Rx<List<College>> _college = Rx<List<College>>([]);
  List<College> get college => _college.value;
  final Rx<List<Course>> _course = Rx<List<Course>>([]);
  List<Course> get course => _course.value;
  final Rx<List<Notification>> _notification = Rx<List<Notification>>([]);
  List<Notification> get notification => _notification.value;
  final Rx<List<model.User>> _userData = Rx<List<model.User>>([]);
  List<model.User> get userData => _userData.value;
  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;
  final RxList<AssignCollege> _assignedColleges = RxList<AssignCollege>([]);
  List<AssignCollege> get assignedColleges => _assignedColleges.value;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
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
  Future<void> updateUserCollegeAndCourseInSubcollection(String userId, String collegeName, String courseName, String deadline) async {
    try {
      final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
      if(deadline.isNotEmpty && collegeName.isNotEmpty && courseName.isNotEmpty) {
        await userRef.collection('college_assign').doc().set({
          'college': collegeName,
          'course': courseName,
          'deadline': deadline,
        });
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
      String notificationId = const Uuid().v1();
      if (title.isNotEmpty && message.isNotEmpty) {
        notification_model.Notification notification =
            notification_model.Notification(
                title: title, message: message, id: notificationId);
        await firestore
            .collection('notifications')
            .doc(notificationId)
            .set(notification.toJson());
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
    _notification.bindStream(firestore
        .collection('notifications')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Notification> retValue = [];
      for (var element in query.docs) {
        retValue.add(Notification.fromSnap(element));
      }
      return retValue;
    }));
  }
}

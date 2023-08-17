import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../Admin/admin_dash.dart';
import '../Student/student_dashboard.dart';
import '../constants.dart';
import '../login_screen.dart';
import '../models/user.dart' as model;
import '../models/college.dart' as college_model;
import '../models/course.dart' as course_model;
import '../models/notification.dart' as notification_model;
import '../models/assign_college.dart' as assign_college_model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<String?> loginType1 = Rx<String?>(null);
  Rx<String?> name = Rx<String?>(null);
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;

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

  void registerCollege(
      String collegeName, String address, String deadline) async {
    try {
      if (collegeName.isNotEmpty && address.isNotEmpty && deadline.isNotEmpty) {
        college_model.College college = college_model.College(
            collegeName: collegeName, deadline: deadline, address: address);
        await firestore.collection('colleges').doc().set(college.toJson());
        Get.snackbar('Alert Message', 'College successfully added');
      } else {
        Get.snackbar('Error adding College', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error adding College', e.toString());
      print(e.toString());
    }
  }

  void registerCourse(String courseName, String collegeName) async {
    try {
      if (collegeName.isNotEmpty && courseName != 'Select') {
        course_model.Course course = course_model.Course(
            courseName: courseName, collegeName: collegeName);
        await firestore.collection('courses').doc().set(course.toJson());
        Get.snackbar('Alert Message', 'Course successfully added');
      } else {
        Get.snackbar('Error adding Course', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error adding Course', e.toString());
      print(e.toString());
    }
  }

  void sendNotification(String title, String date, String message) async {
    try {
      if (title.isNotEmpty && date.isNotEmpty && message.isNotEmpty) {
        notification_model.Notification notification =
            notification_model.Notification(
                title: title, date: date, message: message);
        await firestore
            .collection('notifications')
            .doc()
            .set(notification.toJson());
        Get.snackbar('Alert Message', 'Notification successfully sent');
      } else {
        Get.snackbar(
            'Error sending Notification', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error sending Notification', e.toString());
      print(e.toString());
    }
  }

  void assignCollege(String student, String college, String course) async {
    try {
      if (student != 'Select' && course != 'Select' && college != 'Select') {
        assign_college_model.AssignCollege assignCollege =
            assign_college_model.AssignCollege(
                course: course, college: college, student: student);
        await firestore
            .collection('assign colleges')
            .doc()
            .set(assignCollege.toJson());
        Get.snackbar('Alert Message', 'College successfully assigned');
      } else {
        Get.snackbar('Error assigning College', "Please select all the field");
      }
    } catch (e) {
      Get.snackbar('Error assigning College', e.toString());
      print(e.toString());
    }
  }
}

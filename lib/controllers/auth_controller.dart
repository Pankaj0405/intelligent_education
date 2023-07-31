import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_education/Admin/admin_dash.dart';
import 'package:intelligent_education/Admin/student.dart';
import 'package:intelligent_education/Student/student_dashboard.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/login_screen.dart';
import 'package:intelligent_education/models/user.dart' as model;
class AuthController extends GetxController {
  static AuthController instance=Get.find();
  Rx<String?> logintype1 = Rx<String?>(null);
  late Rx<User?> _user;
late  Rx<File?> _pickedImage;

File? get profilePhoto=> _pickedImage.value;
User get user => _user.value!;

@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user=Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user){
  if(user == null){
    Get.offAll(()=>LoginScreen());
  }else{
    setScreeen();
  }
  }

  //register user
  void registerUser(
      String username, String phone,String email, String password, String logintype) async {
    try {
      if (username.isNotEmpty &&
          phone.isNotEmpty &&
          email.isNotEmpty &&
          logintype.isNotEmpty &&
          password.isNotEmpty) {
        // save a user
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user=model.User(name: username,phone: phone,
            email: email, uid: cred.user!.uid,logintype: logintype);
      await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

      }else{
        Get.snackbar('Error creating Account', "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar('Error creating a account', e.toString());
      print(e.toString());
    }
  }
  void loginUser(String email,String password) async{
try{
if(email.isNotEmpty &&
    password.isNotEmpty){
await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
print('log sucess');
}else{
  Get.snackbar('Error Logging in', "Please enter all the field");
}
}catch(e){
  Get.snackbar('Error logging in', e.toString());
}
  }

  signOut()async{
  await firebaseAuth.signOut();
  }
  getUserData() async {
    DocumentSnapshot userDoc =
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).get();
    final userData = userDoc.data()! as dynamic;
    print(userData);
    logintype1.value= userData['logintype'];
    print(logintype1.value);
    _setInitialScreen(firebaseAuth.currentUser);
  }
  setScreeen() async{
    DocumentSnapshot userDoc =
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).get();
    final userData = userDoc.data()! as dynamic;
    logintype1.value= userData['logintype'];
    if(logintype1.value=='Student'){
      Get.offAll(()=>StudentDashboard());
    }else{
      Get.offAll(()=>AdminDash());
    }
  }

}

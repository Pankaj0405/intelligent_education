import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>authController.setInitialScreen(firebaseAuth.currentUser));
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(60.r),
            child: Center(
              child: Image.asset('images/logo2.png'),
            ),
          ),
        ));
  }
}


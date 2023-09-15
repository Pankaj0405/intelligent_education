import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intelligent_education/api/firebaseapi.dart';
import 'package:intelligent_education/services/notification.dart';
import './splash_screen.dart';
import './login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.configureLocalTimeZone();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intelligent Education',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: const Color(0xFF7A98E5),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.sp,
            ),
            iconTheme: IconThemeData(
              size: 25.r,
              color: Colors.white,
              opacity: 0.8,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

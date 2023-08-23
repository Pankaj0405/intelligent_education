import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import './splash_screen.dart';
import './login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
            iconTheme: IconThemeData(
              size: 25.r,
              color: Colors.white,
              opacity: 0.8,
            ),
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

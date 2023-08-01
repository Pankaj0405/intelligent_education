import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './Admin/college_assign.dart';
import './Admin/courses.dart';
import './Admin/status.dart';
import './Admin/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Student/messaging_screen.dart';
import './Student/student_details_screen.dart';
import './Admin/admin_dash.dart';
import './Admin/notification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import './Student/student_dashboard.dart';
import './Student/student_experience.dart';
import './login_screen.dart';
import './Admin/colleges.dart';
import 'Student/student_document.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) =>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Student(),
         // initialRoute: '/student-details',
        // home: StudentDashboard(),
        // NotificationScreen(),
      ),
    );
  }
}


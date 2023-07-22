import 'package:flutter/material.dart';
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
      builder: (context,child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return const StudentDashboard();
            } else {
              return const LoginScreen();
             }
            },
        ),
        routes: {
           // '/': (context) => const LoginScreen(),
          StudentDocument.routeName: (context) => const StudentDocument(),
          StudentExperience.routeName: (context) => const StudentExperience(),
          NotificationScreen.routeName: (context) => NotificationScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          StudentDashboard.routeName: (context) => const StudentDashboard(),
          StudentDetailsScreen.routeName: (context) => StudentDetailsScreen(),
          MessagingScreen.routeName: (context) => MessagingScreen(),
          AdminDash.routeName: (context) => const AdminDash(),
          CollegeAssign.routeName: (context) => const CollegeAssign(),
          College.routeName: (context) => const College(),
          Courses.routeName: (context) => const Courses(),
          StatusScreen.routeName: (context) => const StatusScreen(),
          Student.routeName: (context) => const Student(),
        },
         // initialRoute: '/student-details',
        // home: StudentDashboard(),
        // NotificationScreen(),
      ),
    );
  }
}


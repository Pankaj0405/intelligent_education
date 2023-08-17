import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:get/get.dart';
import '../Admin/college_assign.dart';
import '../Admin/add_colleges.dart';
import '../Admin/add_notifications.dart';
import '../Admin/status.dart';
import '../Admin/student_details.dart';
import '../Admin/add_users.dart';
import '../constants.dart';
import '../controllers/auth_controller.dart';
import './add_courses.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});
  static const routeName = '/admin-dash';

  @override
  State<AdminDash> createState() => AdminDashState();
}

class AdminDashState extends State<AdminDash> {
  final _authController = Get.put(AuthController());

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromBottom,
    descPadding: EdgeInsets.only(
      top: 10.h,
    ),
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: const TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.center,
    animationDuration: const Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
  );

  logoutDialog() {
    Alert(
      context: context,
      style: alertStyle,
      desc: 'Do you want to logout?',
      buttons: [
        DialogButton(
            color: layoutColor,
            onPressed: () {
              _authController.signOut();
            },
            child: const Text(
              'YES',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        DialogButton(
            color: layoutColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'NO',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(6.0.r),
            child: const CircleAvatar(
              // radius: 15.r,
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.user,
                color: Colors.black,
                // size: 25,
              ),
            ),
          ),
          title: const Text(
            "Admin Name",
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              color: Colors.white,
              onPressed: () {
                // _authController.signOut();
                logoutDialog();
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 20.w,
          padding: EdgeInsets.all(30.r),
          children: [
            gridViewData(
                Icons.school, 'Colleges', () => Get.to(const College())),
            gridViewData(Icons.book, 'Courses', () => Get.to(const Courses())),
            gridViewData(Icons.people, 'Users', () => Get.to(const Student())),
            gridViewData(
                Icons.checklist, 'Status', () => Get.to(const StatusScreen())),
            gridViewData(Icons.notifications, 'Notifications',
                () => Get.to(NotificationScreen())),
            gridViewData(FontAwesomeIcons.university, 'College \n Assign',
                () => Get.to(const CollegeAssign())),
            gridViewData(Icons.info, 'Details', () => Get.to(StudentDetails())),
          ],
        ),
      ),
    );
  }
}

Widget gridViewData(IconData icon, String title, Function() onTap) {
  return SizedBox.fromSize(
    size: Size(20.w, 20.h),
    child: Material(
      elevation: 10,
      color: layoutColor,
      // const Color(0xFF3571E9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: InkWell(
        splashColor: Colors.black54,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35.h,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 23.sp),
            ),
          ],
        ),
      ),
    ),
  );
}

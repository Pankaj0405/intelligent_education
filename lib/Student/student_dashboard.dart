import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Student/notification_screen.dart';
import '../constants.dart';
import '../Student/referee_details_screen.dart';
import '../Student/student_academics.dart';
import '../Student/student_dash_details_screen.dart';
import '../Student/student_document.dart';
import '../Student/student_experience.dart';
import '../controllers/auth_controller.dart';
import '../controllers/firestoremethods.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _authController = Get.put(AuthController());
  final _infoController = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    _authController.getUserData();
    _authController.fetchAssignedColleges();
    return SafeArea(
        child: Scaffold(
      key: _key,
      appBar: AppBar(
        title: Obx(
          () => Text(
            _authController.name.value.toString().toUpperCase(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        leading: Obx(
          () => Padding(
            padding: EdgeInsets.all(8.0.r),
            child: InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: CircleAvatar(
                backgroundColor: layoutColor,
                radius: 5.r,
                backgroundImage: _infoController.profilePhotoGet.value != null
                    ? NetworkImage(_infoController.profilePhotoGet.value!)
                    : const NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/2815/2815428.png"),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Get.to(const NotificationsScreen());
              },
            ),
          ),
        ],
      ),
          body: Obx(() {
            if (_authController.assignedColleges.isEmpty) {
              return Center(child: Text('No assigned colleges.'));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: _authController.assignedColleges.length,
              itemBuilder: (BuildContext ctx, int index) {
                var assignedCollege = _authController.assignedColleges[index];
                print("College: ${assignedCollege.course}");
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: boxColor,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Icon(
                      FontAwesomeIcons.university,
                      color: Colors.black,
                      size: 35.r,
                    ),
                    title: Text(
                      assignedCollege.college,
                      style: TextStyle(fontSize: 22.sp),
                    ),
                    subtitle: Text(
                      assignedCollege.course,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                );
              },
            );
          }),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: _infoController.profilePhotoGet.value != null
                      ? NetworkImage(_infoController.profilePhotoGet.value!)
                      : const NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/2815/2815428.png"),
                  radius: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                _authController.name.value.toString().toUpperCase(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Personal Details'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                Get.to(const StudentDetailsScreen());
              },
            ),
            ListTile(
              title: const Text('Upload Document'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                Get.to(const StudentDocument());
              },
            ),
            ListTile(
              title: const Text('Experience'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                Get.to(const StudentExperience());
              },
            ),
            listTile('Academics', () => Get.to(const AcademicDetails())),
            listTile('Referee Details', () => Get.to(const RefereeDetails())),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            TextButton(
              onPressed: () {
                _authController.signOut();
              },
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Color(0xFF3571E9)),
              ),
            ),
          ],
        ),
      ),
          floatingActionButton: Container(
            margin: EdgeInsets.only(left: 30.w,bottom: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: layoutColor
                    ),
                    child: Center(
                      child: Text(
                          'Book Appointment',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                      ),
                    ),
                  ),
                ),
                // FloatingActionButton(
                //   onPressed: () => {},
                //   backgroundColor: layoutColor,
                //   child: const Icon(
                //     FontAwesomeIcons.solidComments,
                //   ),
                //
                // ),
              ]
        ),
          ),
    ));

  }
}

Widget listTile(String title, Function() onTap) {
  return ListTile(
    title: Text(title),
    trailing: const Icon(Icons.edit),
    onTap: onTap,
  );
}

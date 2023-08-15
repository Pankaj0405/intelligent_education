import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  static const routeName = '/student-dashboard';

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final _authController = Get.put(AuthController());
  final _infoController = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    _authController.getUserData();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            _authController.name.value.toString().toUpperCase(),
          ),
        ),
        centerTitle: true,
        leading: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: layoutColor,
              radius: 5,
              backgroundImage: _infoController.profilePhotoGet.value != null
                  ? NetworkImage(_infoController.profilePhotoGet.value!)
                  : const NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/2815/2815428.png"),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        // width: double.infinity,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: boxColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext ctx, int index) {
                      return const ListTile(
                        tileColor: Colors.white,
                        leading: Icon(
                          FontAwesomeIcons.university,
                          color: Colors.black,
                          size: 35,
                        ),
                        title: Text(
                          'College Name',
                          style: TextStyle(fontSize: 22),
                        ),
                        subtitle: Text(
                          'Course Name',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // _authController.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: layoutColor,
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: const Text(
                        '     Book \nAppointment',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.solidComments,
                    ),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {
                      // Navigator.pushNamed(context, '/messaging-screen');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

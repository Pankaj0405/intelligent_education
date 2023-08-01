import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';
import 'package:intelligent_education/login_screen.dart';
// import 'package:intelligent_education/Student/student_document.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});
  static const routeName = '/student-dashboard';

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {

  final _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 5,
            child: Icon(
              FontAwesomeIcons.user,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Navigator.pushNamed(context, '/notification');
                },
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
          color: Colors.grey[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height * 0.75,
                child:
                ListView.builder(
                    // scrollDirection: Axis.vertical,
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
                        // trailing: CircularProgressIndicator(
                        //   value: 4,
                        // ),
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
                          backgroundColor: Colors.blue,
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
                      Navigator.pushNamed(context, '/messaging-screen');
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
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 60,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Name',
                style: TextStyle(fontSize: 20),
              ),

            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Personal Info'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, '/student-details');
              },
            ),
            ListTile(
              title: const Text('Upload Document'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, '/student-document');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Experience'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, '/student-experience');
                // Navigator.pop(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            TextButton(
              onPressed: () {
              _authController.signOut();
              // Get.off(()=> const LoginScreen());
            },
                child: const Text('Logout',
                style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    ));
  }
}

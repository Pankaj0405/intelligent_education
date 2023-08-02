import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Admin/student.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';
// import 'package:flutter/cupertino.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});
  static const routeName = '/admin-dash';

  @override
  State<AdminDash> createState() => AdminDashState();
}

class AdminDashState extends State<AdminDash> {
  final _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          // leading: Icon(
          //   CupertinoIcons.profile_circled,
          //   color: Colors.black,
          //   size: 30,
          // ),
          leading: IconButton(
            icon: Image.asset('images/DPS.jpg'),
            
            onPressed: () {
              _authController.signOut();
              // Handle leading icon press
            },
          ),
          title: const Text(
            "Admin Name",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Avenir",
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.chat),
              color: Colors.black,
              onPressed: () {
                // Handle chat icon press
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(30),
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Handle button press
                Navigator.pushNamed(context, 'college');
              },
              icon: const Icon(Icons.school),
              label: const Text('College'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle course button press
                Navigator.pushNamed(context, 'course');
              },
              icon: const Icon(Icons.book),
              label: const Text('Course'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
Get.to(() => Student());
                // Navigator.pushNamed(context, 'student');
                Get.to(const Student());
              },
              icon: const Icon(Icons.person),
              label: const Text('Student'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle status button press
                Navigator.pushNamed(context, 'status');
              },
              icon: const Icon(Icons.check),
              label: const Text('Status'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle notification button press
                Navigator.pushNamed(context, '/notification');
              },
              icon: const Icon(Icons.notifications),
              label: const Text('Notification'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle details button press
                Navigator.pushNamed(context, 'details');
              },
              icon: const Icon(Icons.info),
              label: const Text('Details'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

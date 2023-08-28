import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Admin/student_details_screen.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';
import 'package:intelligent_education/controllers/firestoremethods.dart';
import '../constants.dart';
import '../models/user.dart' as model;

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final _authController = Get.put(AuthController());
  final _infoController = Get.put(InfoController());
  List<String> listLength = [];
  String selectedUserId = '';

  listViewLength() async {
    List<model.User> students = await _authController.getAllStudents();
    setState(() {
      listLength = students.map((student) => student.name).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listViewLength();
  }


  @override
  Widget build(BuildContext context) {
    _authController.getUser();
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: const Icon(Icons.info),
        title: const Text(
          "Students' Details",
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        margin: EdgeInsets.only(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: boxColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 10.w,
                  right: 10.w,
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    // focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height * 0.68,
                child: ListView.builder(
                  itemCount: listLength.length,
                  itemBuilder: (context, index) {
                    final student = listLength[index];
                    return InkWell(
                      onTap: () {
                          selectedUserId = _authController.userData.firstWhere((user) => user.name == listLength[index]).uid;
                          Get.to(StudentDetailsScreen(id: selectedUserId, name: student,));
                      },
                      splashColor: Colors.black12,
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        color: Colors.white70,
                        elevation: 10,
                        child: ListTile(
                          leading: Text(student ,style: TextStyle(fontSize: 18.sp),),
                        ),

                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

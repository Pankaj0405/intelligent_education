import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Widgets/details_field.dart';
import '../Widgets/title_list_tile.dart';
import '../controllers/auth_controller.dart';
import '../constants.dart';
import '../Widgets/admin_text_field.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => CourseState();
}

class CourseState extends State<Courses> {
  final _authController = Get.put(AuthController());
  final _courseNameController = TextEditingController();

  void emptyFields() {
    _courseNameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    _authController.getCourse();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.book),
          title: const Text(
            "Courses",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  'Add Course',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
                trailing: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    // Course Name
                    adminTextField('Course Name', _courseNameController,
                        TextInputType.text),

                    Padding(
                      padding: EdgeInsets.fromLTRB(200.w, 0, 0, 20.h),
                      child: ElevatedButton(
                        onPressed: () {
                          _authController.registerCourse(
                              _courseNameController.text);
                          emptyFields();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: layoutColor,
                        ),
                        child: const Text('ADD'),
                      ),
                    ),
                  ],
                ),
              ),
              // Heading 2
              // editListTile(),
              Container(
                margin: EdgeInsets.only(
                  top: 10.h,
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
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 10.h,
                    //     left: 10.w,
                    //     right: 10.w,
                    //   ),
                    //   child: TextField(
                    //     style: const TextStyle(color: Colors.black),
                    //     cursorColor: Colors.blue,
                    //     decoration: InputDecoration(
                    //       // focusColor: Colors.white,
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.r),
                    //       ),
                    //       prefixIcon: const Icon(Icons.search),
                    //       prefixIconColor: Colors.black,
                    //       fillColor: Colors.white70,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: _authController.course.length,
                          itemBuilder: (context, index) {
                            final course = _authController.course[index];
                            return Card(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              color: Colors.white70,
                              elevation: 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                ),
                                child: Column(
                                  children: [
                                    cardListTile('Course Name: ', course.courseName),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      })
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

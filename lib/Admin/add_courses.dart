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

  openBottomSheet() {
    return showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        useSafeArea: true,
        enableDrag: true,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        builder: (BuildContext context) {
          return Container(
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
                adminTextField(
                    'Course Name', _courseNameController, TextInputType.text),

                Padding(
                  padding: EdgeInsets.fromLTRB(200.w, 0, 0, 20.h),
                  child: ElevatedButton(
                    onPressed: () {
                      _authController
                          .registerCourse(_courseNameController.text);
                      emptyFields();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: layoutColor,
                    ),
                    child: const Text('ADD'),
                  ),
                ),
              ],
            ),
          );
        });
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
        body: Obx(() {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            // splashColor: Colors.white,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                enableDrag: true,
                                useSafeArea: true,
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                // ... Other attributes ...
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Container(
                                        // ... Other attributes ...
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: boxColor,
                                        ),
                                        child: Column(
                                          children: [
                                            adminTextField(
                                                course.courseName,
                                                _courseNameController,
                                                TextInputType.text),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: layoutColor,
                                              ),
                                              onPressed: () async {
                                                // Call the updateCollege method to update the data
                                                await _authController
                                                    .updateCourse(
                                                        course.id,
                                                        _courseNameController
                                                            .text);
                                                // Close the bottom sheet
                                                Get.back();
                                              },
                                              child: const Text('SAVE'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              _authController.deleteCourse(course.id);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: layoutColor,
          onPressed: () {
            openBottomSheet();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

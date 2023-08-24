import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Widgets/details_field.dart';
import '../Widgets/title_list_tile.dart';
import '../controllers/auth_controller.dart';
import '../Widgets/admin_text_field.dart';
import '../constants.dart';

class College extends StatefulWidget {
  const College({super.key});

  @override
  State<College> createState() => CollegeState();
}

class CollegeState extends State<College> {
  final _authController = Get.put(AuthController());
  final _collegeNameController = TextEditingController();
  final _addressController = TextEditingController();

  void emptyFields() {
    _collegeNameController.text = "";
    _addressController.text = "";
  }

  openBottomSheet() {
    return showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        enableDrag: true,
        useSafeArea: true,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        builder: (BuildContext context) {
          return Container(
            // margin: EdgeInsets.only(
            //   top: 10.h,
            //   left: 20.w,
            //   right: 20.w,
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: boxColor,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // College Name
                adminTextField(
                    'College Name', _collegeNameController, TextInputType.text),
                adminTextField(
                    'Address', _addressController, TextInputType.text),

                Padding(
                  padding: EdgeInsets.fromLTRB(200.w, 0, 0, 20.h),
                  child: ElevatedButton(
                    onPressed: () {
                      _authController.registerCollege(
                          _collegeNameController.text, _addressController.text);
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
    _authController.getCollege();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.school),
          title: const Text(
            "Colleges",
          ),
        ),
        body: Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _authController.college.length,
            itemBuilder: (context, index) {
              final college = _authController.college[index];
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
                      cardListTile('College Name: ', college.collegeName),
                      cardListTile('Address: ', college.address),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            splashColor: Colors.white,
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
                                                college.collegeName,
                                                _collegeNameController,
                                                TextInputType.text),
                                            adminTextField(
                                                college.address,
                                                _addressController,
                                                TextInputType.text),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: layoutColor,
                                              ),
                                              onPressed: () async {
                                                // Call the updateCollege method to update the data
                                                await _authController
                                                    .updateCollege(
                                                  college.id,
                                                  _collegeNameController.text,
                                                  _addressController.text,
                                                );
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
                              _authController.deleteCollege(college.id);
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

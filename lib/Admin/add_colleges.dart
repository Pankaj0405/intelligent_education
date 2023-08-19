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
  bool college1 = true;
  bool college2 = true;
  bool college3 = true;

  final _collegeNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _deadlineController = TextEditingController();

  void emptyFields() {
    _collegeNameController.text = "";
    _addressController.text = "";
    _deadlineController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.school),
          title: const Text(
            "Colleges",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              titleListTile('Add College'),
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
                    // College Name
                    adminTextField('College Name', _collegeNameController,
                        TextInputType.text),
                    adminTextField(
                        'Address', _addressController, TextInputType.text),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8.r),
                    //     color: Colors.white,
                    //   ),
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: 10.0.h, horizontal: 25.0.w),
                    //   child: ListTile(
                    //     title: TextField(
                    //       textAlign: TextAlign.center,
                    //       keyboardType: TextInputType.datetime,
                    //       controller: _deadlineController,
                    //       decoration: InputDecoration(
                    //         hintText: 'Deadline',
                    //         hintStyle: TextStyle(fontSize: 16.sp),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8.r),
                    //           borderSide: const BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //         filled: true,
                    //         contentPadding: EdgeInsets.all(16.r),
                    //       ),
                    //     ),
                    //     trailing: const Icon(Icons.date_range),
                    //   ),
                    // ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(200.w, 0, 0, 20.h),
                      child: ElevatedButton(
                        onPressed: () {
                          _authController.registerCollege(
                              _collegeNameController.text,
                              _addressController.text);
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
              editListTile(),
              Container(
                margin: EdgeInsets.only(
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
                    Padding(
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, int) {
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
                                  cardListTile('College Name: ', 'ABC College'),
                                  cardListTile('Address: ', 'Roorkee, India'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // add/delete button
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     IconButton(
                    //       splashColor: Colors.white,
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.edit),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.delete),
                    //     ),
                    //   ],
                    // ),
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

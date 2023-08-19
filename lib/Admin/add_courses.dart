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
  // checkbox
bool course1 = false;
  // Initial Selected Value
  // String dropDownValue = 'Select';
  final _courseNameController = TextEditingController();

  // List of items in our dropdown menu
  // var items = [
  //   'Select',
  //   'College 1',
  //   'College 2',
  //   'College 3',
  //   'College 4',
  //   'College 5',
  // ];

  void emptyFields() {
    _courseNameController.text = "";
    // dropDownValue = "Select";
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                // padding: const EdgeInsets.all(3.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    // Course Name
                    adminTextField('Course Name', _courseNameController,
                        TextInputType.text),
                    // Container(
                    //   width: double.maxFinite,
                    //   padding: EdgeInsets.only(
                    //     left: 10.w,
                    //     right: 10.w,
                    //   ),
                    //   margin: EdgeInsets.only(
                    //     bottom: 10.h,
                    //     left: 20.w,
                    //     right: 20.w,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5.r),
                    //     color: Colors.white70,
                    //   ),
                    //   alignment: Alignment.center,
                    //   // borderRadius: BorderRadius.circular(10.r),
                    //   child: DropdownButton(
                    //     borderRadius: BorderRadius.circular(10.r),
                    //     isExpanded: true,
                    //     style: TextStyle(
                    //       overflow: TextOverflow.fade,
                    //       color: Colors.black,
                    //       fontSize: 15.sp,
                    //     ),
                    //     // Initial Value
                    //     dropdownColor: Colors.white,
                    //     value: dropDownValue,
                    //
                    //     // Down Arrow Icon
                    //     icon: const Icon(Icons.keyboard_arrow_down),
                    //
                    //     // Array list of items
                    //     items: items.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     // After selecting the desired option,it will
                    //     // change button value to selected value
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropDownValue = newValue!;
                    //       });
                    //     },
                    //   ),
                    // ),

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
                        itemCount: 10,
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
                                  cardListTile('Course Name: ', 'Bachelor in Technology'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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

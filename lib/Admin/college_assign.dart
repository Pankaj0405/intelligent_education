import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../constants.dart';

class CollegeAssign extends StatefulWidget {
  const CollegeAssign({super.key});
  static const routeName = '/college-assign';

  @override
  State<CollegeAssign> createState() => CollegeAssignState();
}

class CollegeAssignState extends State<CollegeAssign> {
  final _authController = Get.put(AuthController());
  final _deadlineController = TextEditingController();

  String collegeDropDown = 'Select';
  String courseDropDown = 'Select';
  String studentDropDown = 'Select';

  // List of items in our dropdown menu
  var items = [
    'Select',
    'College 1',
    'College 2',
    'College 3',
    'College 4',
    'College 5',
    'Quantum University Mandawar Roorkee Haridwar nkdwjkdddl ofiodsofvfr'
  ];

  var items2 = [
    'Select',
    'Course 1',
    'Course 2',
  ];

  var items3 = [
    'Select',
    'Student 1',
    'Student 2',
    'Student 3',
  ];

  void defaultValue() {
    collegeDropDown = 'Select';
    courseDropDown = 'Select';
    studentDropDown = 'Select';
    setState(() {});
  }

  var textStyle = TextStyle(
    overflow: TextOverflow.fade,
    color: Colors.black,
    fontSize: 15.sp,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.info),
          title: const Text(
            "College Assign",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Assign Colleges',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                ),
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    // Student Name
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          'Student: ',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        )),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        dropdownColor: Colors.white,
                        value: studentDropDown,
                        style: textStyle,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items3.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            studentDropDown = newValue!;
                          });
                        },
                      ),
                    ),
                    // College
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          'College: ',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        )),
                    Container(
                      // height: 40.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded:true,
                        // Initial Value
                        dropdownColor: Colors.white,
                        style: textStyle,
                        value: collegeDropDown,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            collegeDropDown = newValue!;
                          });
                        },
                      ),
                    ),
                    // Course
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          'Course: ',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        )),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        dropdownColor: Colors.white,
                        style: textStyle,
                        value: courseDropDown,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            courseDropDown = newValue!;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(
                           vertical: 10.0.h,
                        // horizontal: 10.0.w
                         ),
                      child: ListTile(
                        title: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          controller: _deadlineController,
                          decoration: InputDecoration(
                            hintText: 'Deadline',
                            hintStyle: TextStyle(fontSize: 16.sp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16.r),
                          ),
                        ),
                        trailing: const Icon(Icons.date_range),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(200.w, 0, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: layoutColor,
                          ),
                          onPressed: () {
                            _authController.assignCollege(studentDropDown, collegeDropDown, courseDropDown, _deadlineController.text);
                            defaultValue();
                          },
                          child: const Text('ASSIGN')),
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

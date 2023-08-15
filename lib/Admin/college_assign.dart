import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class CollegeAssign extends StatefulWidget {
  const CollegeAssign({super.key});
  static const routeName = '/college-assign';

  @override
  State<CollegeAssign> createState() => CollegeAssignState();
}

class CollegeAssignState extends State<CollegeAssign> {
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

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.info),
          title: const Text("College Assign",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              )),
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
              // const SizedBox(height: 30),
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
                  borderRadius: BorderRadius.circular(20),
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
                      width: 200.w,
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        // Initial Value
                        dropdownColor: Colors.white,
                        value: studentDropDown,

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
                      width: 200.w,
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        // Initial Value
                        dropdownColor: Colors.white,
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
                      width: 200.w,
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        // Initial Value
                        dropdownColor: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: layoutColor,
                          ),
                          onPressed: onPressed,
                          child: const Text('ADD')),
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

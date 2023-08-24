import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  get cartItem => null;

  @override
  State<StatusScreen> createState() => Project();
}

class Project extends State<StatusScreen> {
  // checkbox
  bool student1 = false;

  // Initial Selected Value
  String dropdownvalue1 = 'College Name 1';

  // List of college in our dropdown menu
  var college = [
    'College Name 1',
    'College Name 2',
    'College Name 3',
    'College Name 4',
    'College Name 5',
  ];

  String dropdownvalue2 = 'Course Name 1';
  var course = [
    'Course Name 1',
    'Course Name 2',
    'Course Name 3',
    'Course Name 4',
    'Course Name 5',
  ];
  var textStyle = TextStyle(
    overflow: TextOverflow.fade,
    color: Colors.black,
    fontSize: 15.sp,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // leading: const Icon(Icons.checklist),
          title: const Text(
            "Status",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 30),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 10.w,
                ),
                child: Text(
                  'Status',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue1,
                        style: textStyle,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of college
                        items: college.map((String college) {
                          return DropdownMenuItem(
                            value: college,
                            child: Text(college),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue1 = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue2,
                        style: textStyle,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of courses
                        items: course.map((String courses) {
                          return DropdownMenuItem(
                            value: courses,
                            child: Text(courses),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: layoutColor,
                        ),
                        child: const Text('CHECK'))
                  ],
                ),
              ),

              // Heading 2
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 10.w,
                  bottom: 10.h,
                ),
                child: Text(
                  'Selected Students',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
              ),
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
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white70,
                            elevation: 10,
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Padding(
                                      padding: EdgeInsets.only(
                                        left: 10.w,
                                      ),
                                      child: Text('Ram Shyam Sharma', style: TextStyle(fontSize: 18.sp)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        splashColor: Colors.white,
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ],
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
                    // const Divider(height: 0),
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

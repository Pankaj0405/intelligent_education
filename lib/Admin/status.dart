import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  static const routeName = '/status';
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
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            leading: const Icon(Icons.checklist),
            title: const Text(
              "Status",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  // letterSpacing: 2.0,
                  // wordSpacing: 4.0),
            )),),
        body: Column(
          children: [
            // const SizedBox(height: 30),
           Container(
             alignment: Alignment.topLeft,
             padding: EdgeInsets.only(
               top: 10.h,
               left: 10.w,
             ),
             child: const Text(
                'Status',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
           ),
            // Heading 1
            // const Padding(
            //   padding: EdgeInsets.fromLTRB(10, 0, 230, 0),
            //   child: Text(
            //     "Details",
            //     style: TextStyle(
            //         // fontFamily: 'Pacifico',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 25.0,
            //         letterSpacing: 2.0,
            //         wordSpacing: 4.0),
            //   ),
            // ),

            // const SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[400],
              ),
              child: Column(
                children: [
                  Container(
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white70,
                    ),
                    alignment: Alignment.center,
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue1,

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
                  SizedBox(height: 10.h,),
                  Container(
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white70,
                    ),
                    alignment: Alignment.center,
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue2,

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
                ],
              ),
            ),


            // const SizedBox(height: 60),

            // Heading 2
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                top: 10.h,
                left: 10.w,
                bottom: 10.h,
              ),
              child: const Text(
                'Selected Students',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[400],
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.black,
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, int) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: CheckboxListTile(
                              value: student1,
                              onChanged: (bool? value) {
                                setState(() {
                                  student1 = value!;
                                });
                              },
                              title: const Text('Student 1')),
                        );
                      },
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
                  // const Divider(height: 0),
                ],
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.fromLTRB(10, 0, 100, 0),
            //   child: Text(
            //     "Selected Students",
            //     style: TextStyle(
            //         // fontFamily: 'Pacifico',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 25.0,
            //         letterSpacing: 2.0,
            //         wordSpacing: 4.0),
            //   ),
            // ),
            //
            // const SizedBox(height: 15),

            // checkbox
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            //   child: CheckboxListTile(
            //       value: student1,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           student1 = value!;
            //         });
            //       },
            //       title: const Text('Student 1')),
            // ),
            // const Divider(height: 0),
            //
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            //   child: CheckboxListTile(
            //     value: student2,
            //     onChanged: (bool? value) {
            //       setState(() {
            //         student2 = value!;
            //       });
            //     },
            //     title: const Text('Student 2'),
            //   ),
            // ),
            // const Divider(height: 0),
            //
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            //   child: CheckboxListTile(
            //     value: student3,
            //     onChanged: (bool? value) {
            //       setState(() {
            //         student3 = value!;
            //       });
            //     },
            //     title: const Text('Student 3'),
            //   ),
            // ),
            // const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}

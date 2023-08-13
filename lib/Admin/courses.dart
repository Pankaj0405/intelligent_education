import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/admin_text_field.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});
  // static const routeName = '/course';

  @override
  State<Courses> createState() => CourseState();
}

class CourseState extends State<Courses> {
  // checkbox
  bool course1 = true;
  bool course2 = true;
  bool course3 = true;

  // Initial Selected Value
  String dropdownvalue = 'College 1';

  final _courseNameController = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'College 1',
    'College 2',
    'College 3',
    'College 4',
    'College 5',
  ];

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            leading: const Icon(Icons.book),
            title: const Text(
              "Courses",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  // letterSpacing: 2.0,
                  // wordSpacing: 4.0),
        ),),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
              leading: Text(
                'Add Course',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              trailing: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
              ),
            ),
              // const SizedBox(height: 30),

              // Heading 1
              // Padding(
              //   padding: EdgeInsets.only(
              //     top: 10.h,
              //     left: 10.w,
              //   ),
              //   child: const Align(
              //     alignment: Alignment.topLeft,
              //     child: Text(
              //       "Add Courses",
              //       style: TextStyle(
              //           // fontFamily: 'Pacifico',
              //           fontWeight: FontWeight.bold,
              //           fontSize: 25.0,
              //           // letterSpacing: 2.0,
              //           // wordSpacing: 4.0),
              //     ),),
              //   ),
              // ),

              // const SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                // padding: const EdgeInsets.all(3.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: Column(
                  children: [
                    // Course Name
                    adminTextField('Course Name', _courseNameController, TextInputType.text),
                    // Card(
                    //   color: Colors.white,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 8.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     title: TextField(
                    //       textAlign: TextAlign.center,
                    //       keyboardType: TextInputType.text,
                    //       decoration: InputDecoration(
                    //         hintText: 'Course Name',
                    //         hintStyle: const TextStyle(fontSize: 16),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: const BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //         filled: true,
                    //         contentPadding: const EdgeInsets.all(16),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        // Initial Value
                        dropdownColor: Colors.white,
                        value: dropdownvalue,

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
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 0, 0, 20),
                      child: ElevatedButton(
                          onPressed: onPressed, child: const Text('ADD')),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 30,),
              // const SizedBox(height: 30),
              Divider(
                height: 20.h,
                color: Colors.black,
                indent: 100.w,
                endIndent: 100.w,
                thickness: 2,),
              // Heading 2
              const ListTile(
                leading: Text(
                  'Edit/Remove',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.edit_note,
                  color: Colors.black,
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
                                value: course1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    course1 = value!;
                                  });
                                },
                                title: const Text('Course 1')),
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
              // const SizedBox(height: 15),
              // Container(
              //   margin: const EdgeInsets.all(15.0),
              //   padding: const EdgeInsets.all(3.0),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.blueAccent)),
              //   child: Column(
              //     children: [
              //       // Search
              //       const Card(
              //         color: Colors.white,
              //         margin: EdgeInsets.symmetric(
              //             vertical: 10.0, horizontal: 25.0),
              //         child: ListTile(
              //           leading: Icon(Icons.search),
              //           title: Text('Search'),
              //         ),
              //       ),
              //
              //       // checkbox
              //       Padding(
              //         padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              //         child: CheckboxListTile(
              //             value: course1,
              //             onChanged: (bool? value) {
              //               setState(() {
              //                 course1 = value!;
              //               });
              //             },
              //             title: const Text('Course 1')),
              //       ),
              //       const Divider(height: 0),
              //
              //       Padding(
              //         padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              //         child: CheckboxListTile(
              //           value: course2,
              //           onChanged: (bool? value) {
              //             setState(() {
              //               course2 = value!;
              //             });
              //           },
              //           title: const Text('Course 2'),
              //         ),
              //       ),
              //       const Divider(height: 0),
              //
              //       Padding(
              //         padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              //         child: CheckboxListTile(
              //           value: course3,
              //           onChanged: (bool? value) {
              //             setState(() {
              //               course3 = value!;
              //             });
              //           },
              //           title: const Text('Course 3'),
              //           // isThreeLine: true,
              //         ),
              //       ),
              //       const Divider(height: 0),
              //
              //       // add/delete button
              //       ListTile(
              //         title: Row(
              //           children: <Widget>[
              //             Padding(
              //               padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
              //               child: ElevatedButton(
              //                   onPressed: onPressed,
              //                   child: const Text('Edit')),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //               child: ElevatedButton(
              //                   onPressed: onPressed,
              //                   child: const Text('Remove')),
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

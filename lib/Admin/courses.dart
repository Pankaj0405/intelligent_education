import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../Widgets/admin_text_field.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

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
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                leading: Text(
                  'Add Course',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
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
                  borderRadius: BorderRadius.circular(20),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    // Course Name
                    adminTextField('Course Name', _courseNameController,
                        TextInputType.text),
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
                        onPressed: onPressed,
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
              const ListTile(
                leading: Text(
                  'Edit/Remove',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                        itemCount: 10,
                        itemBuilder: (context, int) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: CheckboxListTile(
                                activeColor: layoutColor,
                                value: course1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    course1 = value!;
                                  });
                                },
                                title: const Text(
                                  'Course 1',
                                  overflow: TextOverflow.ellipsis,
                                )),
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

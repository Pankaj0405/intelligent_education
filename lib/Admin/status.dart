import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  static const routeName = '/status';
  get cartItem => null;

  @override
  State<StatusScreen> createState() => Project();
}

class Project extends State<StatusScreen> {
  // checkbox
  bool student1 = true;
  bool student2 = true;
  bool student3 = true;

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
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Status",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  wordSpacing: 4.0),
            )),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(height: 30),
                // Heading 1
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 230, 0),
                  child: Text(
                    "Details",
                    style: TextStyle(
                        // fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        wordSpacing: 4.0),
                  ),
                ),

                const SizedBox(height: 15),

                // college list
                DropdownButton(
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
                // course list
                DropdownButton(
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

                const SizedBox(height: 60),

                // Heading 2
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 100, 0),
                  child: Text(
                    "Selected Students",
                    style: TextStyle(
                        // fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        wordSpacing: 4.0),
                  ),
                ),

                const SizedBox(height: 15),

                // checkbox
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: CheckboxListTile(
                      value: student1,
                      onChanged: (bool? value) {
                        setState(() {
                          student1 = value!;
                        });
                      },
                      title: const Text('Student 1')),
                ),
                const Divider(height: 0),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: CheckboxListTile(
                    value: student2,
                    onChanged: (bool? value) {
                      setState(() {
                        student2 = value!;
                      });
                    },
                    title: const Text('Student 2'),
                  ),
                ),
                const Divider(height: 0),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: CheckboxListTile(
                    value: student3,
                    onChanged: (bool? value) {
                      setState(() {
                        student3 = value!;
                      });
                    },
                    title: const Text('Student 3'),
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

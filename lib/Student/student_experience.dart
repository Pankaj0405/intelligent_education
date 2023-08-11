import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/details_field.dart';

class StudentExperience extends StatefulWidget {
  const StudentExperience({super.key});

  static const routeName = '/student-experience';

  @override
  State<StudentExperience> createState() => _StudentExperienceState();
}

class _StudentExperienceState extends State<StudentExperience> {
  bool experience1 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
        centerTitle: true,
        leading: const Icon(FontAwesomeIcons.wrench),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20.h,
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: MediaQuery.of(context).size.height * 0.60,
              child: Column(
                children: [
                  const ListTile(
                    leading: Text(
                      'Experience',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    trailing: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                  ),
                  listTileFieldInfo('Organization: '),
                  listTileFieldInfo('Address: '),
                  listTileFieldInfo('Job Title: '),
                  listTileFieldInfo('Contact No.: '),
                  listTileFieldInfo('Salary/Stipend: '),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('From: ', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 30,
                        width: 70,
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                      ),
                      const Text('To: ', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 30,
                        width: 70,
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text('SUBMIT'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Edit / Remove",
                        style: TextStyle(
                          // fontFamily: 'Pacifico',
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          // letterSpacing: 2.0,
                          // wordSpacing: 4.0
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
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
                              value: experience1,
                              onChanged: (bool? value) {
                                setState(() {
                                  experience1 = value!;
                                });
                              },
                              title: const Text('Experience 1')),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
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
          ],
        ),
      ),
    ));
  }
}

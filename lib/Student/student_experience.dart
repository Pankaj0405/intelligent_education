import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/details_field.dart';

class StudentExperience extends StatefulWidget {
  const StudentExperience({super.key});

  // static const routeName = '/student-experience';

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
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[400],
              ),
              // height: MediaQuery.of(context).size.height * 0.60,
              child: Column(
                children: [
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
                    height: MediaQuery.of(context).size.height * 0.05,
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
             Divider(
              color: Colors.black,
               indent: 100.w,
               endIndent: 100.w,
               thickness: 2,),
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
            //  Padding(
            //   padding: EdgeInsets.only(
            //     // top: 20.h,
            //     left: 20.w,
            //   ),
            //   child: const Align(
            //     alignment: Alignment.topLeft,
            //     child: Text(
            //       "Edit / Remove",
            //       style: TextStyle(
            //         // fontFamily: 'Pacifico',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 25.0,
            //         // letterSpacing: 2.0,
            //         // wordSpacing: 4.0
            //       ),
            //     ),
            //   ),
            // ),
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
          ],
        ),
      ),
    ));
  }
}

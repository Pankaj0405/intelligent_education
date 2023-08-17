import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_education/Widgets/title_list_tile.dart';
import '../constants.dart';
import '../Widgets/details_field.dart';

class StudentExperience extends StatefulWidget {
  const StudentExperience({super.key});

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
        leading: const Icon(FontAwesomeIcons.wrench),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            titleListTile('Experience'),
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: boxColor,
              ),
              // height: MediaQuery.of(context).size.height * 0.60,
              child: Column(
                children: [
                  listTileFieldInfo('Organization: '),
                  listTileFieldInfo('Address: '),
                  listTileFieldInfo('Job Title: '),
                  listTileFieldInfo('Contact No.: '),
                  listTileFieldInfo('Salary/Stipend: '),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('From: ', style: TextStyle(fontSize: 18.sp)),
                      SizedBox(
                        height: 30.h,
                        width: 70.w,
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                        ),
                      ),
                      Text('To: ', style: TextStyle(fontSize: 18.sp)),
                      SizedBox(
                        height: 30.h,
                        width: 70.w,
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
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
                        backgroundColor: layoutColor,
                        padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        )),
                    child: const Text('SUBMIT'),
                  ),
                ],
              ),
            ),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, int) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                          child: CheckboxListTile(
                              activeColor: layoutColor,
                              value: experience1,
                              onChanged: (bool? value) {
                                setState(() {
                                  experience1 = value!;
                                });
                              },
                              title: const Text(
                                'Experience 1',
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

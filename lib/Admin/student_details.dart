import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  bool student = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: const Icon(Icons.info),
        title: const Text(
          "Students' Details",
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        margin: EdgeInsets.only(
          top: 20.h,
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
            Expanded(
              flex: 1,
              child: Padding(
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
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height * 0.68,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, int) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                      child: CheckboxListTile(
                          activeColor: layoutColor,
                          value: student,
                          onChanged: (bool? value) {
                            setState(() {
                              student = value!;
                            });
                          },
                          title: const Text(
                            'Student 1',
                            overflow: TextOverflow.ellipsis,
                          )),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
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
            ),
          ],
        ),
      ),
    ));
  }
}

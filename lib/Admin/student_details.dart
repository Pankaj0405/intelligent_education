import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class StudentDetails extends StatefulWidget {
  StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  bool student = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.info),
        title: const Text("Students' Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            )),
      ),
      body: Container(
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
              height: 10.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, int) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
    ));
  }
}

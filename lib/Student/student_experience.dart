import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentExperience extends StatelessWidget {
  const StudentExperience({super.key});
  static const routeName = '/student-experience';

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
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            children: [
              const ListTile(
                leading: Text(
                  'Experience',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
              ),
              expInfo('Organization: '),
              expInfo('Location: '),
              expInfo('Employee Id: '),
              expInfo('Salary: '),
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
      ),
    ));
  }

  Widget expInfo(String text) {
    return Expanded(
      flex: 0,
      child: ListTile(
        leading: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: SizedBox(
          height: 30.h,
          width: 200.w,
          child: TextField(
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.blue,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Widgets/admin_text_field.dart';
// import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  // static const routeName = '/student';

  @override
  State<Student> createState() => StudentState();
}

class StudentState extends State<Student> {
  final _authController = Get.put(AuthController());
  String dropdownvalue = 'Student';
  var items = [
    'Student',
    'Admin',
  ];
  bool student1 = false;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void emptyFields() {
    _emailController.text = "";
    _nameController.text = "";
    _phoneController.text = "";
    _passController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
          leading: const Icon(Icons.people),
            title: const Text(
              "Users",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  // letterSpacing: 2.0,
                  // wordSpacing: 4.0),
            )),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 30),

              // Heading 1
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(10, 0, 170, 0),
              //   child: Text(
              //     "Add User",
              //     style: TextStyle(
              //         // fontFamily: 'Pacifico',
              //         fontWeight: FontWeight.bold,
              //         fontSize: 25.0,
              //         // letterSpacing: 2.0,
              //         // wordSpacing: 4.0),
              //   ),),
              // ),
              const ListTile(
                leading: Text(
                  'Add User',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
              ),
              // const SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: TextField(
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.text,
                    //     controller: _nameController,
                    //     decoration: InputDecoration(
                    //       hintText: 'Name',
                    //       hintStyle: const TextStyle(fontSize: 16),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //         borderSide: const BorderSide(
                    //           width: 0,
                    //           style: BorderStyle.none,
                    //         ),
                    //       ),
                    //       filled: true,
                    //       contentPadding: const EdgeInsets.all(16),
                    //     ),
                    //   ),
                    // ),
                    adminTextField('Name', _nameController, TextInputType.text),
                    adminTextField('Email', _emailController, TextInputType.emailAddress),
                    adminTextField('Phone No.', _phoneController, TextInputType.phone),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: TextField(
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.emailAddress,
                    //     controller: _emailController,
                    //     decoration: InputDecoration(
                    //       hintText: 'E-mail',
                    //       hintStyle: const TextStyle(fontSize: 16),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //         borderSide: const BorderSide(
                    //           width: 0,
                    //           style: BorderStyle.none,
                    //         ),
                    //       ),
                    //       filled: true,
                    //       contentPadding: const EdgeInsets.all(16),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: TextField(
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.phone,
                    //     controller: _phoneController,
                    //     decoration: InputDecoration(
                    //       hintText: 'Phone no.',
                    //       hintStyle: const TextStyle(fontSize: 16),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //         borderSide: const BorderSide(
                    //           width: 0,
                    //           style: BorderStyle.none,
                    //         ),
                    //       ),
                    //       filled: true,
                    //       contentPadding: const EdgeInsets.all(16),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        obscuringCharacter: '*',
                        controller: _passController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton(
                        focusColor: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        value: dropdownvalue,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownvalue = value!;
                          });
                        },
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 0, 0, 20),
                      child: ElevatedButton(
                          onPressed: () {
                            _authController.registerUser(
                                _nameController.text,
                                _phoneController.text,
                                _emailController.text,
                                _passController.text,
                                dropdownvalue);

                            emptyFields();
                          },
                          child: const Text('ADD')),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 50),
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

              // const SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: Column(
                  children: [
                    // Search
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

                    // checkbox
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
                    // const Divider(height: 0),

                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //   child: CheckboxListTile(
                    //     value: college2,
                    //     onChanged: (bool? value) {
                    //       setState(() {
                    //         college2 = value!;
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
                    //     value: college3,
                    //     onChanged: (bool? value) {
                    //       setState(() {
                    //         college3 = value!;
                    //       });
                    //     },
                    //     title: const Text('Student 3'),
                    //   ),
                    // ),
                    // const Divider(height: 0),

                    // add/delete button
                    // ListTile(
                    //   title: Row(
                    //     children: <Widget>[
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                    //         child: ElevatedButton(
                    //             onPressed: () {}, child: const Text('Edit')),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    //         child: ElevatedButton(
                    //             onPressed: () {},
                    //             child: const Text('Remove')),
                    //       ),
                    //     ],
                    //   ),
                    // )
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

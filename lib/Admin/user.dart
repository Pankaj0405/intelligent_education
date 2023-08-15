import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Widgets/admin_text_field.dart';
import '../constants.dart';
import '../controllers/auth_controller.dart';

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
          title: const Text("Users",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                leading: Text(
                  'Add User',
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    adminTextField('Name', _nameController, TextInputType.text),
                    adminTextField(
                        'Email', _emailController, TextInputType.emailAddress),
                    adminTextField(
                        'Phone No.', _phoneController, TextInputType.phone),
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: layoutColor,
                          ),
                          child: const Text('ADD')),
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
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: boxColor,
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
                                activeColor: layoutColor,
                                onChanged: (bool? value) {
                                  setState(() {
                                    student1 = value!;
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
            ],
          ),
        ),
      ),
    );
  }
}

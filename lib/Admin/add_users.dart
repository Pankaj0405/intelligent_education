import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Widgets/details_field.dart';
import '../Widgets/title_list_tile.dart';
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

  openBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
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
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 25.0.w),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: _passController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 16.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      contentPadding: EdgeInsets.all(16.sp),
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    top: 10.h,
                    left: 20.w,
                    right: 20.w,
                    bottom: 10.h,
                  ),
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white70,
                  ),
                  alignment: Alignment.center,
                  child: DropdownButton(
                    isExpanded: true,
                    focusColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10.r),
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
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(200.w, 0, 0, 20.h),
                  child: ElevatedButton(
                      onPressed: () {
                        _authController.registerUser(
                            _nameController.text,
                            _phoneController.text,
                            _emailController.text,
                            _passController.text,
                            dropdownvalue);
                        emptyFields();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: layoutColor,
                      ),
                      child: const Text('ADD')),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _authController.getUser();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.people),
          title: const Text("Users",
              ),
        ),
        body: Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _authController.userData.length,
            itemBuilder: (context, index) {
              final user = _authController.userData[index];
              return Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                color: Colors.white70,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      cardListTile('Name: ', user.name),
                      cardListTile('Email: ', user.email),
                      cardListTile('Phone No.: ', user.phone),
                      cardListTile('User Type: ', user.logintype),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            splashColor: Colors.white,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                enableDrag: true,
                                useSafeArea: true,
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                // ... Other attributes ...
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Container(
                                        // ... Other attributes ...
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20.r),
                                          color: boxColor,
                                        ),
                                        child: Column(
                                          children: [
                                            adminTextField(
                                                user.name,
                                                _nameController,
                                                TextInputType.text),
                                            adminTextField(
                                                user.email,
                                                _emailController,
                                                TextInputType.emailAddress),
                                            adminTextField(user.phone, _phoneController, TextInputType.phone),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: layoutColor,
                                              ),
                                              onPressed: () async {
                                                // Call the updateCollege method to update the data
                                                await _authController
                                                    .updateUser(
                                                  _nameController.text,
                                                  _emailController.text,
                                                  _phoneController.text,
                                                  user.uid,
                                                );
                                                // Close the bottom sheet
                                                Get.back();
                                              },
                                              child: const Text('SAVE'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            splashColor: Colors.white,
                            onPressed: () {
                              _authController.deleteUser(user.uid);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: layoutColor,
          onPressed: () {
            openBottomSheet();
          },
          child: const Icon(Icons.add),
        ),

      ),
    );
  }
}

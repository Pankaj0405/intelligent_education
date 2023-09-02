import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/models/college.dart';
import 'package:intelligent_education/models/course.dart';
import 'package:intl/intl.dart';
import '../controllers/auth_controller.dart';
import '../constants.dart';
import '../models/user.dart' as model;

class CollegeAssign extends StatefulWidget {
  const CollegeAssign({super.key});
  static const routeName = '/college-assign';

  @override
  State<CollegeAssign> createState() => CollegeAssignState();
}

class CollegeAssignState extends State<CollegeAssign> {
  final _authController = Get.put(AuthController());
  final _deadlineController = TextEditingController();

  late String collegeDropDown = 'select';
  late String courseDropDown = 'select';
  late String studentDropDown = 'select';

  // List of items in our dropdown menu
  List<String> items = [];

  List<String> items2 = [];

  List<String> items3 = [];
  String selectedCollegeId = '';
  String selectedCourseId = '';
  String selectedUserId = '';

  void defaultValue() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populateCollegeDropdown();
    populateCourseDropdown();
    populateStudentDropdown();
  }

  void populateCollegeDropdown() async {
    List<College> colleges = await _authController.getAllColleges();
    setState(() {
      items = colleges.map((college) => college.collegeName).toList();
      collegeDropDown = items[0]; // Set the default value
    });
  }

  void populateCourseDropdown() async {
    List<Course> courses = await _authController.getAllCourses();
    setState(() {
      items2 = courses.map((course) => course.courseName).toList();
      courseDropDown = items2[0]; // Set the default value
    });
  }

  void populateStudentDropdown() async {
    List<model.User> students = await _authController.getAllStudents();
    setState(() {
      items3 = students.map((student) => student.name).toList();
      studentDropDown = items3[0]; // Set the default value
    });
  }

  var textStyle = TextStyle(
    overflow: TextOverflow.fade,
    color: Colors.black,
    fontSize: 15.sp,
  );

   final List<TextEditingController> _controllers = [];
   final List<TextField> _fields = [];


  @override
  Widget build(BuildContext context) {
    _authController.getCollege();
    _authController.getCourse();
    _authController.getUser();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.info),
          title: const Text(
            "College Assign",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Assign Colleges',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                ),
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    // Student Name
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          'Student: ',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        )),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        dropdownColor: Colors.white,
                        value: studentDropDown,
                        style: textStyle,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items3.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            studentDropDown = newValue!;
                            selectedUserId = _authController.userData
                                .firstWhere((user) => user.name == newValue)
                                .uid;
                            print(selectedUserId);
                          });
                        },
                      ),
                    ),
                    // College
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          'College: ',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        )),
                    Container(
                      // height: 40.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
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
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        dropdownColor: Colors.white,
                        style: textStyle,
                        value: collegeDropDown,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            collegeDropDown = newValue!;
                            selectedCollegeId = _authController.college
                                .firstWhere((college) =>
                                    college.collegeName == newValue)
                                .id;
                            print(selectedCollegeId);
                            print(collegeDropDown);
                          });
                        },
                      ),
                    ),
                    // Course
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          'Course: ',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        )),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white70,
                      ),
                      alignment: Alignment.center,
                      // borderRadius: BorderRadius.circular(10.r),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        isExpanded: true,
                        // Initial Value
                        dropdownColor: Colors.white,
                        style: textStyle,
                        value: courseDropDown,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            courseDropDown = newValue!;
                            selectedCourseId = _authController.course
                                .firstWhere(
                                    (course) => course.courseName == newValue)
                                .id;
                            print(selectedCourseId);
                          });
                        },
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8.r),
                    //     color: Colors.white,
                    //   ),
                    //   margin: EdgeInsets.symmetric(
                    //        vertical: 10.0.h,
                    //     // horizontal: 10.0.w
                    //      ),
                    //   child: ListTile(
                    //     title: TextField(
                    //       textAlign: TextAlign.center,
                    //       keyboardType: TextInputType.datetime,
                    //       controller: _deadlineController,
                    //       decoration: InputDecoration(
                    //         hintText: 'Deadline',
                    //         hintStyle: TextStyle(fontSize: 16.sp),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8.r),
                    //           borderSide: const BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //         filled: true,
                    //         contentPadding: EdgeInsets.all(16.r),
                    //       ),
                    //     ),
                    //     trailing:  IconButton(
                    //     onPressed:() async{
                    //     DateTime? pickedDate = await showDatePicker(
                    //     context: context,
                    //     initialDate: DateTime.now(),
                    //     firstDate: DateTime(2015),
                    //     lastDate: DateTime(2121)
                    //     // DateTime(2000), //DateTime.now() - not to allow to choose before today.
                    //     );
                    //
                    //     if (pickedDate != null) {
                    //     print(
                    //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    //     String formattedDate =
                    //     DateFormat('yyyy-MM-dd').format(pickedDate);
                    //     print(
                    //     formattedDate); //formatted date output using intl package =>  2021-03-16
                    //     //you can implement different kind of Date Format here according to your requirement
                    //
                    //     setState(() {
                    //     _deadlineController.text =
                    //     formattedDate; //set output date to TextField value.
                    //     });
                    //     } else {
                    //     print("Date is not selected");
                    //     }
                    //     },
                    //       icon: const Icon(Icons.date_range) ,),
                    //   ),
                    // ),
                    TextField(
                      readOnly: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.datetime,
                      controller: _deadlineController,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: layoutColor,
                                      onPrimary: boxColor!,
                                      onSurface: Colors.black,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: layoutColor,
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2121),
                              // DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            );

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                _deadlineController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          icon: Icon(Icons.date_range, color: layoutColor,),
                        ),
                        hintText: 'Deadline1',
                        hintStyle: TextStyle(fontSize: 16.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16.r),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: _listView()),
                    Padding(
                      padding: EdgeInsets.fromLTRB(200.w, 0, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: layoutColor,
                          ),
                          onPressed: () {
                            // _authController
                            //     .updateUserCollegeAndCourseInSubcollection(
                            //         selectedUserId,
                            //         collegeDropDown,
                            //         courseDropDown,
                            //         _deadlineController.text);
                            print(selectedUserId);
                            print(collegeDropDown);
                            print(courseDropDown);
                            defaultValue();
                          },
                          child: const Text('ASSIGN')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: layoutColor,
          onPressed: () {
            final controller = TextEditingController();
            final field = TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.datetime,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: layoutColor,
                                onPrimary: boxColor!,
                                onSurface: Colors.black,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: layoutColor,
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2121),
                        // DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        );

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        controller.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  icon: Icon(Icons.date_range, color: layoutColor,),
                ),
                hintText: 'Deadline${_controllers.length + 2}',
                hintStyle: TextStyle(fontSize: 16.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16.r),
              ),
            );
            setState(() {
              _controllers.add(controller);
              _fields.add(field);
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: _fields[index],
        );
      },
    );
  }
}

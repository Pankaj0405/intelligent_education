import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';
import 'package:intl/intl.dart';

import '../Widgets/details_field.dart';

class EditCollegeAssign extends StatefulWidget {
  final String uid;
  final String docId;
  const EditCollegeAssign({required this.uid, required this.docId, super.key});

  @override
  State<EditCollegeAssign> createState() => _EditCollegeAssignState();
}

class _EditCollegeAssignState extends State<EditCollegeAssign> {
  final _authController = Get.put(AuthController());
  String statusDropDown = 'Application in process';
  final _deadlineController = TextEditingController();

  List<String> items = [
    'Application in process',
    'Submitted to University',
    'College shortlisted',
    'Interview shortlisted',
    'Offer Received',
    'Rejected'
  ];

  var textStyle = TextStyle(
    overflow: TextOverflow.fade,
    color: Colors.black,
    fontSize: 15.sp,
  );

  @override
  Widget build(BuildContext context) {
    _authController.fetchdeadlinesData(widget.uid,widget.docId);
    _authController.getDeadlines(widget.uid, widget.docId);
    // final List<String> deadlines = [];
    // for (final doc in _authController.deadlinesData) {
    //   // Modify this condition based on your data
    //   final String  captureDateTime = doc['deadline'];
    //   deadlines.add(
    //     captureDateTime,
    //   );
    // }
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit College Assigned'),
          ),
      // body: Text('${widget.uid}\n${widget.docId}'),
          body: Obx(() => Container(
            margin: EdgeInsets.all(10.r),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: boxColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      bottom: 10.h,
                    ),
                    child: Text(
                      'Status: ',
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
                    value: statusDropDown,
                    style: textStyle,
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
                        statusDropDown = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      itemCount:
                      _authController.deadlines.length,
                      // deadlines.length,
                      itemBuilder: (context, index) {
                        final deadline = _authController.deadlines[index];
                        return Card(
                          color: boxColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(
                                    bottom: 10.h,
                                  ),
                                  child: Text(
                                    'Deadline${index + 1}: ',
                                    style: TextStyle(
                                        fontSize: 25.sp, fontWeight: FontWeight.w500),
                                  )),
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
                                  hintText: deadline.deadline,
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
                              // cardListTile('Deadline ${index + 1}: ', deadline.deadline),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    splashColor: Colors.white,
                                    onPressed: () {
                                      _authController.updateDeadlines(_deadlineController.text, widget.uid, widget.docId, deadline.id);
                                    },
                                    icon: const Icon(Icons.save),
                                  ),
                                  IconButton(
                                    splashColor: Colors.white,
                                    onPressed: () {
                                      _authController.deleteDeadlines(widget.uid, widget.docId, deadline.id);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: layoutColor,
                  ),
                  onPressed: () async {
                    // Call the updateCollege method to update the data
                    _authController.updateAssignedCollege(statusDropDown, widget.uid, widget.docId);
                    // Close the bottom sheet
                    Get.back();
                  },
                  child: const Text('SAVE'),
                ),
              ],
            ),
          ))
          ,
    ));
  }
}

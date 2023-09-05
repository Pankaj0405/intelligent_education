import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../constants.dart';

class CollegeAssignedScreen extends StatefulWidget {
  final String uid;
  const CollegeAssignedScreen({required this.uid, super.key});

  @override
  State<CollegeAssignedScreen> createState() => _CollegeAssignedScreenState();
}

class _CollegeAssignedScreenState extends State<CollegeAssignedScreen> {
  final _authController = Get.put(AuthController());
  var textStyle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);
  String statusDropDown = 'Application in process';

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
    _authController.getAssignedColleges(widget.uid);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('College Assigned'),
      ),
      body: Obx(
        () => _authController.assignedColleges.isNotEmpty
            ? ListView.builder(
                itemCount: _authController.assignedColleges.length,
                itemBuilder: (context, index) {
                  final assignedCollege =
                      _authController.assignedColleges[index];
                  return Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: 20.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: boxColor,
                    ),
                    child: Card(
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
                            // Text(widget.uid),
                            cardListTile('College: ', assignedCollege.college),
                            cardListTile('Course: ', assignedCollege.course),
                            cardListTile('Status: ', assignedCollege.status),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  splashColor: Colors.white,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      // isScrollControlled: true,
                                      useSafeArea: true,
                                      enableDrag: true,
                                      showDragHandle: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
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
                                                  Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          EdgeInsets.only(
                                                            left: 20.h,
                                                        bottom: 10.h,
                                                      ),
                                                      child: Text(
                                                        'Status: ',
                                                        style: TextStyle(
                                                            fontSize: 25.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                  Container(
                                                    width: double.maxFinite,
                                                    padding: EdgeInsets.only(
                                                      left: 10.w,
                                                      right: 10.w,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      left: 20.h,
                                                      right: 20.h,
                                                      bottom: 10.h,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(5.r),
                                                      color: Colors.white70,
                                                    ),
                                                    alignment:
                                                        Alignment.center,
                                                    // borderRadius: BorderRadius.circular(10.r),
                                                    child: DropdownButton(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10.r),
                                                      isExpanded: true,
                                                      // Initial Value
                                                      dropdownColor:
                                                          Colors.white,
                                                      value: statusDropDown,
                                                      style: textStyle,
                                                      // Down Arrow Icon
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down),

                                                      // Array list of items
                                                      items: items.map(
                                                          (String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      // After selecting the desired option,it will
                                                      // change button value to selected value
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          statusDropDown =
                                                              newValue!;
                                                        });
                                                      },
                                                    ),
                                                  ),

                                                  // adminTextField(
                                                  //     parentInfo
                                                  //         .mobileno!,
                                                  //     _parentMobileNoController,
                                                  //     TextInputType
                                                  //         .number),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          layoutColor,
                                                    ),
                                                    onPressed: () async {
                                                      // Call the updateParentInfo method to update the data
                                                      await _authController
                                                          .updateAssignedCollege(
                                                              statusDropDown,
                                                              widget.uid,
                                                              assignedCollege
                                                                  .id);

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
                                  onPressed: () {
                                    _authController.deleteAssignedCollege(
                                        widget.uid, assignedCollege.id);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: Text(
                  'College not assigned yet',
                  style: textStyle2,
                ),
              ),
      ),
      // Center(child: Text(widget.uid)),
    ));
  }
}

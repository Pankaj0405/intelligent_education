import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/firestoremethods.dart';
import '../constants.dart';
import '../Widgets/details_field.dart';

class StudentExperience extends StatefulWidget {
  const StudentExperience({super.key});

  @override
  State<StudentExperience> createState() => _StudentExperienceState();
}

class _StudentExperienceState extends State<StudentExperience> {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final _organizationController = TextEditingController();
  final _addressController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _contactController = TextEditingController();
  final _salaryController = TextEditingController();
  final InfoController _infoController = Get.put(InfoController());

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
              top: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: boxColor,
            ),
            child: Column(
              children: [
                listTileFieldInfo('Organization: ', _organizationController),
                listTileFieldInfo('Address: ', _addressController),
                listTileFieldInfo('Job Title: ', _jobTitleController),
                listTileFieldInfo('Contact No.: ', _contactController),
                listTileFieldInfo('Salary/Stipend: ', _salaryController),
                ListTile(
                  leading: Text('From: ', style: TextStyle(fontSize: 18.sp)),
                  trailing: SizedBox(
                    height: 30.h,
                    width: 120.w,
                    child: TextField(
                      controller: fromDateController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor:
                          Colors.blue, //editing controller of this TextField
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
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
                            fromDateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: Text('To: ', style: TextStyle(fontSize: 18.sp)),
                  trailing: SizedBox(
                    height: 30.h,
                    width: 120.w,
                    child: TextField(
                      controller: toDateController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor:
                          Colors.blue, //editing controller of this TextField
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2121)
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
                            toDateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    _addExperienceInfoToDb();
                  emptyFields();
                  Get.back();
                  },
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
          );
        });
  }

  _addExperienceInfoToDb() async {
    if (_areFieldsEmpty()) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      await _infoController.postExperience(
        _organizationController.text,
        _addressController.text,
        _jobTitleController.text,
        _contactController.text,
        _salaryController.text,
        fromDateController.text,
        toDateController.text,
      );
     }
  }

  bool _areFieldsEmpty() {
    return _organizationController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _jobTitleController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _salaryController.text.isEmpty ||
        fromDateController.text.isEmpty ||
        toDateController.text.isEmpty;
  }

  emptyFields() {
    _organizationController.text = "";
    _salaryController.text = "";
    _addressController.text ="";
    _jobTitleController.text ="";
    _contactController.text = "";
    fromDateController.text = "";
    toDateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    _infoController.getExperience();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: _infoController.experiences.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final experience = _infoController.experiences[index];
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
                        cardListTile('Organization: ', experience.organization),
                        cardListTile('Address: ', experience.address),
                        cardListTile('Job Title: ', experience.jobtitle),
                        cardListTile('Contact No.: ', experience.contactno),
                        cardListTile('Salary/Stipend: ', experience.salary),
                        cardListTile('From: ', experience.datefrom),
                        cardListTile('To: ', experience.dateto),
                      ],
                    ),
                  ),
                ),
              );
              //   Padding(
              //   padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
              //   child: CheckboxListTile(
              //       activeColor: layoutColor,
              //       value: experience1,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           experience1 = value!;
              //         });
              //       },
              //       title: const Text(
              //         'Experience 1',
              //         overflow: TextOverflow.ellipsis,
              //       )),
              // );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: layoutColor,
        onPressed: () {
          openBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}

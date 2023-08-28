import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/controllers/firestoremethods.dart';
import 'package:intl/intl.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../Widgets/input_field.dart';
import '../constants.dart';

class StudentDetailsScreen extends StatefulWidget {
  final String id;
  final String name;
  const StudentDetailsScreen({required this.id, required this.name, super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _infoController = Get.put(InfoController());
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _currentAddressController = TextEditingController();
  final _permanentAddressController = TextEditingController();
  final _passportNoController = TextEditingController();
  final _passportLocationController = TextEditingController();
  final _issueDateController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _organizationController = TextEditingController();
  final _addressController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _salaryController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _fatherOccupationController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _motherOccupationController = TextEditingController();
  final _parentAddressController = TextEditingController();
  final _parentEmailController = TextEditingController();
  final _parentMobileNoController = TextEditingController();
  final _guardianNameController = TextEditingController();
  final _guardianGenderController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _guardianAddressController = TextEditingController();
  final _guardianPhoneController = TextEditingController();
  final _instituteNameController = TextEditingController();
  final _academicsCountryController = TextEditingController();
  final _academicsCourseController = TextEditingController();
  final _levelController = TextEditingController();
  final _percentageController = TextEditingController();
  final _refereeNameController = TextEditingController();
  final _refereeOrganizationController = TextEditingController();
  final _refereeRelationshipController = TextEditingController();
  final _refereeJobTitleController = TextEditingController();
  final _workMailController = TextEditingController();
  final _refereePhoneController = TextEditingController();
  final _refereeAddressController = TextEditingController();
  DateTime _selectedFromDate = DateTime.now();
  DateTime _selectedToDate = DateTime.now();
  DateTime _selectedDob = DateTime.now();
  DateTime _selectedIssueDate = DateTime.now();
  DateTime _selectedExpiryDate = DateTime.now();

  var textStyle = TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600);
  var textStyle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));
    if (_pickerDate != null) {
      setState(() {
        _selectedDob = _pickerDate;
        _selectedIssueDate = _pickerDate;
        _selectedExpiryDate = _pickerDate;
        _selectedFromDate = _pickerDate;
        _selectedToDate = _pickerDate;
      });
    } else {
      print("It is null or somthing is wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    _infoController.getPersonalInfo(widget.id);
    _infoController.getParentInfo(widget.id);
    _infoController.getRefereeForAdmin(widget.id);
    _infoController.getAcademicsForAdmin(widget.id);
    _infoController.getExperienceForAdmin(widget.id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body:
            // _infoController.personalInfo.isEmpty &&
            //         _infoController.parentInfo.isEmpty &&
            //         _infoController.emergencyInfo.isEmpty &&
            //         _infoController.academics.isEmpty &&
            //         _infoController.experiences.isEmpty &&
            //         _infoController.referee.isEmpty
            //     ? Center(
            //     child: Text(
            //       'Details yet to be uploaded',
            //       style: textStyle2,
            //     ))
            Obx(() => SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Personal Details
                    _infoController.personalInfo.isNotEmpty
                        ? Obx(() {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        _infoController.personalInfo.length,
                                    itemBuilder: (context, index) {
                                      final personalInfo =
                                          _infoController.personalInfo[index];
                                      return Container(
                                        margin: EdgeInsets.only(
                                          left: 20.w,
                                          right: 20.w,
                                          bottom: 20.h,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: boxColor,
                                        ),
                                        child: Card(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 10.h,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          color: Colors.white70,
                                          elevation: 10,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.h,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Personal Details',
                                                  style: textStyle,
                                                ),
                                                cardListTile('Full Name: ',
                                                    personalInfo.fullname!),
                                                cardListTile('Date of Birth: ',
                                                    personalInfo.dateofbirth!),
                                                cardListTile('Gender: ',
                                                    personalInfo.gender!),
                                                cardListTile('Nationality: ',
                                                    personalInfo.nationality!),
                                                cardListTile(
                                                    'Current Address: ',
                                                    personalInfo
                                                        .currentaddress!),
                                                cardListTile(
                                                    'Permanent Address: ',
                                                    personalInfo
                                                        .permanentaddress!),
                                                cardListTile('Passport No: ',
                                                    personalInfo.passportno!),
                                                cardListTile(
                                                    'Passport Issue Location: ',
                                                    personalInfo
                                                        .passportlocation!),
                                                cardListTile(
                                                    'Passport Issue Date: ',
                                                    personalInfo.issuedate!),
                                                cardListTile(
                                                    'Passport Expiry Date: ',
                                                    personalInfo.expirydate!),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      splashColor: Colors.white,
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          useSafeArea: true,
                                                          showDragHandle: true,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r),
                                                          ),
                                                          // ... Other attributes ...
                                                          builder: (BuildContext
                                                              context) {
                                                            return StatefulBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  StateSetter
                                                                      setState) {
                                                                return Container(
                                                                  // ... Other attributes ...
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.r),
                                                                    color:
                                                                        boxColor,
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        adminTextField(
                                                                            personalInfo.fullname!,
                                                                            _nameController,
                                                                            TextInputType.name),
                                                                        MyInputField(
                                                                          title:
                                                                              "Date of Birth",
                                                                          hint:
                                                                              DateFormat.yMd().format(_selectedDob),
                                                                          controller:
                                                                              _dobController,
                                                                          widget:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.calendar_today_outlined,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              _getDateFromUser();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        adminTextField(
                                                                            personalInfo.gender!,
                                                                            _genderController,
                                                                            TextInputType.text),
                                                                        adminTextField(
                                                                            personalInfo.nationality!,
                                                                            _nationalityController,
                                                                            TextInputType.text),
                                                                        adminTextField(
                                                                            personalInfo.currentaddress!,
                                                                            _currentAddressController,
                                                                            TextInputType.text),
                                                                        adminTextField(
                                                                            personalInfo.permanentaddress!,
                                                                            _permanentAddressController,
                                                                            TextInputType.text),
                                                                        adminTextField(
                                                                            personalInfo.passportno!,
                                                                            _passportNoController,
                                                                            TextInputType.text),
                                                                        adminTextField(
                                                                            personalInfo.passportlocation!,
                                                                            _passportLocationController,
                                                                            TextInputType.text),
                                                                        MyInputField(
                                                                          title:
                                                                              "Passport Issue Date",
                                                                          hint:
                                                                              DateFormat.yMd().format(_selectedIssueDate),
                                                                          controller:
                                                                              _issueDateController,
                                                                          widget:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.calendar_today_outlined,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              _getDateFromUser();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        MyInputField(
                                                                          title:
                                                                              "Passport Expiry Date",
                                                                          controller:
                                                                              _expiryDateController,
                                                                          hint:
                                                                              DateFormat.yMd().format(_selectedExpiryDate),
                                                                          widget:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.calendar_today_outlined,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              _getDateFromUser();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                layoutColor,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            // Call the updateCollege method to update the data
                                                                            await _infoController.updatePersonalInfo(
                                                                              _nameController.text,
                                                                              _dobController.text,
                                                                              _genderController.text,
                                                                              _nationalityController.text,
                                                                              _currentAddressController.text,
                                                                              _permanentAddressController.text,
                                                                              _passportNoController.text,
                                                                              _passportLocationController.text,
                                                                              _issueDateController.text,
                                                                              _expiryDateController.text,
                                                                              widget.id,
                                                                              personalInfo.id!,
                                                                            );
                                                                            // Close the bottom sheet
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              const Text('SAVE'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        _infoController
                                                            .deletePersonalInfo(
                                                                widget.id,
                                                                personalInfo
                                                                    .id!);
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  endIndent: 100.w,
                                  indent: 100.w,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            );
                          })
                        : const Text(''),

                    // Parents Details
                    _infoController.parentInfo.isNotEmpty
                        ? Obx(
                            () => Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          _infoController.parentInfo.length,
                                      itemBuilder: (context, index) {
                                        final parentInfo =
                                            _infoController.parentInfo[index];
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: 20.w,
                                            right: 20.w,
                                            bottom: 20.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: boxColor,
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                              vertical: 10.h,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            color: Colors.white70,
                                            elevation: 10,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Parents\' Details',
                                                    style: textStyle,
                                                  ),
                                                  cardListTile(
                                                      'Father\'s Name: ',
                                                      parentInfo.fathername!),
                                                  cardListTile(
                                                      'Father\'s Occupation: ',
                                                      parentInfo
                                                          .fatheroccupation!),
                                                  cardListTile(
                                                      'Mother\'s Name: ',
                                                      parentInfo.mothername!),
                                                  cardListTile(
                                                      'Mother\'s Occupation: ',
                                                      parentInfo
                                                          .motheroccupation!),
                                                  cardListTile('Address: ',
                                                      parentInfo.address!),
                                                  cardListTile('Email: ',
                                                      parentInfo.email!),
                                                  cardListTile('Mobile No: ',
                                                      parentInfo.mobileno!),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        splashColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            useSafeArea: true,
                                                            showDragHandle:
                                                                true,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.r),
                                                            ),
                                                            // ... Other attributes ...
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState) {
                                                                  return Container(
                                                                    // ... Other attributes ...
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.r),
                                                                      color:
                                                                          boxColor,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          adminTextField(
                                                                              parentInfo.fathername!,
                                                                              _fatherNameController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              parentInfo.fatheroccupation!,
                                                                              _fatherOccupationController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              parentInfo.mothername!,
                                                                              _motherNameController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              parentInfo.motheroccupation!,
                                                                              _motherOccupationController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              parentInfo.address!,
                                                                              _parentAddressController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              parentInfo.email!,
                                                                              _parentEmailController,
                                                                              TextInputType.emailAddress),
                                                                          adminTextField(
                                                                              parentInfo.mobileno!,
                                                                              _parentMobileNoController,
                                                                              TextInputType.number),
                                                                          ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: layoutColor,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              // Call the updateParentInfo method to update the data
                                                                              await _infoController.updateParentInfo(_fatherNameController.text, _fatherOccupationController.text, _motherNameController.text, _motherOccupationController.text, _parentAddressController.text, _parentEmailController.text, _parentMobileNoController.text, widget.id, parentInfo.id!);

                                                                              // Close the bottom sheet
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text('SAVE'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          _infoController
                                                              .deleteParentInfo(
                                                                  widget.id,
                                                                  parentInfo
                                                                      .id!);
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Divider(
                                  thickness: 2,
                                  endIndent: 100.w,
                                  indent: 100.w,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          )
                        : const Text(''),

                    // Emergency Details
                    _infoController.emergencyInfo.isNotEmpty
                        ? Obx(
                            () => Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          _infoController.emergencyInfo.length,
                                      itemBuilder: (context, index) {
                                        final emergencyInfo = _infoController
                                            .emergencyInfo[index];
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: 20.w,
                                            right: 20.w,
                                            bottom: 20.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: boxColor,
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                              vertical: 10.h,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            color: Colors.white70,
                                            elevation: 10,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Emergency Details',
                                                    style: textStyle,
                                                  ),
                                                  cardListTile(
                                                      'Guardian\'s Name: ',
                                                      emergencyInfo.fullName!),
                                                  cardListTile('Gender: ',
                                                      emergencyInfo.gender!),
                                                  cardListTile(
                                                      'Relationship: ',
                                                      emergencyInfo
                                                          .relationship!),
                                                  cardListTile('Address: ',
                                                      emergencyInfo.address!),
                                                  cardListTile('Mobile No: ',
                                                      emergencyInfo.mobileNo!),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        splashColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            useSafeArea: true,
                                                            showDragHandle:
                                                                true,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.r),
                                                            ),
                                                            // ... Other attributes ...
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState) {
                                                                  return Container(
                                                                    // ... Other attributes ...
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.r),
                                                                      color:
                                                                          boxColor,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          adminTextField(
                                                                              emergencyInfo.fullName!,
                                                                              _guardianNameController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              emergencyInfo.gender!,
                                                                              _guardianGenderController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              emergencyInfo.relationship!,
                                                                              _relationshipController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              emergencyInfo.address!,
                                                                              _guardianAddressController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              emergencyInfo.mobileNo!,
                                                                              _guardianPhoneController,
                                                                              TextInputType.number),
                                                                          ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: layoutColor,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              // Call the updateParentInfo method to update the data
                                                                              await _infoController.updateEmergencyInfo(_guardianNameController.text, _guardianGenderController.text, _relationshipController.text, _guardianAddressController.text, _guardianPhoneController.text, widget.id, emergencyInfo.id!);

                                                                              // Close the bottom sheet
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text('SAVE'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          _infoController
                                                              .deleteEmergencyInfo(
                                                                  widget.id,
                                                                  emergencyInfo
                                                                      .id!);
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Divider(
                                  thickness: 2,
                                  endIndent: 100.w,
                                  indent: 100.w,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          )
                        : const Text(''),

                    // Academics Details
                    _infoController.academics.isNotEmpty
                        ? Obx(
                            () => Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          _infoController.academics.length,
                                      itemBuilder: (context, index) {
                                        final academics =
                                            _infoController.academics[index];
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: 20.w,
                                            right: 20.w,
                                            bottom: 20.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: boxColor,
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                              vertical: 10.h,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            color: Colors.white70,
                                            elevation: 10,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Academics Details',
                                                    style: textStyle,
                                                  ),
                                                  cardListTile(
                                                      'Institute Name: ',
                                                      academics.instituteName),
                                                  cardListTile('Country: ',
                                                      academics.country),
                                                  cardListTile('Course: ',
                                                      academics.course),
                                                  cardListTile(
                                                      'Level of Study: ',
                                                      academics.level),
                                                  cardListTile(
                                                      'Percentage/CGPA: ',
                                                      academics.percentage),
                                                  cardListTile('From: ',
                                                      academics.fromDate),
                                                  cardListTile(
                                                      'To: ', academics.toDate),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        splashColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            useSafeArea: true,
                                                            showDragHandle:
                                                                true,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.r),
                                                            ),
                                                            // ... Other attributes ...
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState) {
                                                                  return Container(
                                                                    // ... Other attributes ...
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.r),
                                                                      color:
                                                                          boxColor,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          adminTextField(
                                                                              academics.instituteName,
                                                                              _instituteNameController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              academics.country,
                                                                              _academicsCountryController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              academics.course,
                                                                              _academicsCourseController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              academics.level,
                                                                              _levelController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              academics.percentage,
                                                                              _percentageController,
                                                                              TextInputType.number),
                                                                          MyInputField(
                                                                            title:
                                                                                "From",
                                                                            hint:
                                                                                DateFormat.yMd().format(_selectedFromDate),
                                                                            controller:
                                                                                _fromDateController,
                                                                            widget:
                                                                                IconButton(
                                                                              icon: const Icon(
                                                                                Icons.calendar_today_outlined,
                                                                                color: Colors.grey,
                                                                              ),
                                                                              onPressed: () {
                                                                                _getDateFromUser();
                                                                              },
                                                                            ),
                                                                          ),
                                                                          MyInputField(
                                                                            title:
                                                                                "To",
                                                                            controller:
                                                                                _toDateController,
                                                                            hint:
                                                                                DateFormat.yMd().format(_selectedToDate),
                                                                            widget:
                                                                                IconButton(
                                                                              icon: const Icon(
                                                                                Icons.calendar_today_outlined,
                                                                                color: Colors.grey,
                                                                              ),
                                                                              onPressed: () {
                                                                                _getDateFromUser();
                                                                              },
                                                                            ),
                                                                          ),
                                                                          ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: layoutColor,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              // Call the updateCollege method to update the data
                                                                              await _infoController.updateAcademics(_instituteNameController.text, _academicsCountryController.text, _academicsCourseController.text, _levelController.text, _percentageController.text, _fromDateController.text, _toDateController.text, widget.id, academics.id);

                                                                              // Close the bottom sheet
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text('SAVE'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          _infoController
                                                              .deleteAcademics(
                                                                  widget.id,
                                                                  academics.id);
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Divider(
                                  thickness: 2,
                                  endIndent: 100.w,
                                  indent: 100.w,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          )
                        : const Text(''),

                    // Experiences Details
                    _infoController.experiences.isNotEmpty
                        ? Obx(
                            () => Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          _infoController.experiences.length,
                                      itemBuilder: (context, index) {
                                        final experience =
                                            _infoController.experiences[index];
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: 20.w,
                                            right: 20.w,
                                            bottom: 20.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: boxColor,
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                              vertical: 10.h,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            color: Colors.white70,
                                            elevation: 10,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Experiences Details',
                                                    style: textStyle,
                                                  ),
                                                  cardListTile('Organization: ',
                                                      experience.organization),
                                                  cardListTile('Address: ',
                                                      experience.address),
                                                  cardListTile('Job Title: ',
                                                      experience.jobtitle),
                                                  cardListTile('Contact No.: ',
                                                      experience.contactno),
                                                  cardListTile(
                                                      'Salary/Stipend: ',
                                                      experience.salary),
                                                  cardListTile('From: ',
                                                      experience.datefrom),
                                                  cardListTile('To: ',
                                                      experience.dateto),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        splashColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            useSafeArea: true,
                                                            showDragHandle:
                                                                true,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.r),
                                                            ),
                                                            // ... Other attributes ...
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState) {
                                                                  return Container(
                                                                    // ... Other attributes ...
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.r),
                                                                      color:
                                                                          boxColor,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          adminTextField(
                                                                              experience.organization,
                                                                              _organizationController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              experience.address,
                                                                              _addressController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              experience.jobtitle,
                                                                              _jobTitleController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              experience.contactno,
                                                                              _contactNoController,
                                                                              TextInputType.phone),
                                                                          adminTextField(
                                                                              experience.salary,
                                                                              _salaryController,
                                                                              TextInputType.number),
                                                                          MyInputField(
                                                                            title:
                                                                                "From",
                                                                            hint:
                                                                                DateFormat.yMd().format(_selectedFromDate),
                                                                            controller:
                                                                                _fromDateController,
                                                                            widget:
                                                                                IconButton(
                                                                              icon: const Icon(
                                                                                Icons.calendar_today_outlined,
                                                                                color: Colors.grey,
                                                                              ),
                                                                              onPressed: () {
                                                                                _getDateFromUser();
                                                                              },
                                                                            ),
                                                                          ),
                                                                          MyInputField(
                                                                            title:
                                                                                "To",
                                                                            controller:
                                                                                _toDateController,
                                                                            hint:
                                                                                DateFormat.yMd().format(_selectedToDate),
                                                                            widget:
                                                                                IconButton(
                                                                              icon: const Icon(
                                                                                Icons.calendar_today_outlined,
                                                                                color: Colors.grey,
                                                                              ),
                                                                              onPressed: () {
                                                                                _getDateFromUser();
                                                                              },
                                                                            ),
                                                                          ),
                                                                          ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: layoutColor,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              // Call the updateCollege method to update the data
                                                                              await _infoController.updateExperience(_organizationController.text, _addressController.text, _jobTitleController.text, _contactNoController.text, _salaryController.text, _fromDateController.text, _toDateController.text, widget.id, experience.id);

                                                                              // Close the bottom sheet
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text('SAVE'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          _infoController
                                                              .deleteExperience(
                                                                  widget.id,
                                                                  experience
                                                                      .id);
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Divider(
                                  thickness: 2,
                                  endIndent: 100.w,
                                  indent: 100.w,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          )
                        : const Text(''),

                    // Referee Details
                    _infoController.referee.isNotEmpty
                        ? Obx(
                            () => Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: _infoController.referee.length,
                                      itemBuilder: (context, index) {
                                        final referee =
                                            _infoController.referee[index];
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: 20.w,
                                            right: 20.w,
                                            bottom: 20.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: boxColor,
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                              vertical: 10.h,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            color: Colors.white70,
                                            elevation: 10,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Referee Details',
                                                    style: textStyle,
                                                  ),
                                                  cardListTile('Referee Name: ',
                                                      referee.refereeName),
                                                  cardListTile('Relationship: ',
                                                      referee.relationship),
                                                  cardListTile('Organization: ',
                                                      referee.organization),
                                                  cardListTile('Job Title: ',
                                                      referee.jobTitle),
                                                  cardListTile('Work Email: ',
                                                      referee.workMail),
                                                  cardListTile('Contact No.: ',
                                                      referee.contactNo),
                                                  cardListTile('Address: ',
                                                      referee.address),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        splashColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            useSafeArea: true,
                                                            showDragHandle:
                                                                true,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.r),
                                                            ),
                                                            // ... Other attributes ...
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState) {
                                                                  return Container(
                                                                    // ... Other attributes ...
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.r),
                                                                      color:
                                                                          boxColor,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          adminTextField(
                                                                              referee.refereeName,
                                                                              _refereeNameController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              referee.relationship,
                                                                              _refereeRelationshipController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              referee.organization,
                                                                              _refereeOrganizationController,
                                                                              TextInputType.name),
                                                                          adminTextField(
                                                                              referee.jobTitle,
                                                                              _refereeJobTitleController,
                                                                              TextInputType.text),
                                                                          adminTextField(
                                                                              referee.workMail,
                                                                              _workMailController,
                                                                              TextInputType.emailAddress),
                                                                          adminTextField(
                                                                              referee.contactNo,
                                                                              _refereePhoneController,
                                                                              TextInputType.phone),
                                                                          adminTextField(
                                                                              referee.address,
                                                                              _refereeAddressController,
                                                                              TextInputType.text),
                                                                          ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: layoutColor,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              // Call the updateCollege method to update the data
                                                                              await _infoController.updateReferee(_refereeNameController.text, _refereeRelationshipController.text, _refereeOrganizationController.text, _refereeJobTitleController.text, _workMailController.text, _refereePhoneController.text, _refereeAddressController.text, widget.id, referee.id);

                                                                              // Close the bottom sheet
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text('SAVE'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          _infoController
                                                              .deleteReferee(
                                                                  widget.id,
                                                                  referee.id);
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Divider(
                                  thickness: 2,
                                  endIndent: 100.w,
                                  indent: 100.w,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          )
                        : const Text(''),
                  ],
                ))),
      ),
    );
  }
}

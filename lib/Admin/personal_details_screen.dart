import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../Widgets/input_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final String id;
  const PersonalDetailsScreen({required this.id, super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
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
      });
    } else {
      print("It is null or somthing is wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    _infoController.getPersonalInfo(widget.id);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
        ),
      ),
      body: Obx(() {
        return _infoController.personalInfo.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _infoController.personalInfo.length,
                itemBuilder: (context, index) {
                  final personalInfo = _infoController.personalInfo[index];
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
                            Text(
                              'Personal Details',
                              style: textStyle,
                            ),
                            cardListTile('Full Name: ', personalInfo.fullname!),
                            cardListTile(
                                'Date of Birth: ', personalInfo.dateofbirth!),
                            cardListTile('Gender: ', personalInfo.gender!),
                            cardListTile(
                                'Nationality: ', personalInfo.nationality!),
                            cardListTile('Current Address: ',
                                personalInfo.currentaddress!),
                            cardListTile('Permanent Address: ',
                                personalInfo.permanentaddress!),
                            cardListTile(
                                'Passport No: ', personalInfo.passportno!),
                            cardListTile('Passport Issue Location: ',
                                personalInfo.passportlocation!),
                            cardListTile('Passport Issue Date: ',
                                personalInfo.issuedate!),
                            cardListTile('Passport Expiry Date: ',
                                personalInfo.expirydate!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  splashColor: Colors.white,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      useSafeArea: true,
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
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    adminTextField(
                                                        personalInfo.fullname!,
                                                        _nameController,
                                                        TextInputType.name),
                                                    MyInputField(
                                                      title: "Date of Birth",
                                                      hint: DateFormat.yMd()
                                                          .format(_selectedDob),
                                                      controller:
                                                          _dobController,
                                                      widget: IconButton(
                                                        icon: const Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed: () {
                                                          _getDateFromUser();
                                                        },
                                                      ),
                                                    ),
                                                    adminTextField(
                                                        personalInfo.gender!,
                                                        _genderController,
                                                        TextInputType.text),
                                                    adminTextField(
                                                        personalInfo
                                                            .nationality!,
                                                        _nationalityController,
                                                        TextInputType.text),
                                                    adminTextField(
                                                        personalInfo
                                                            .currentaddress!,
                                                        _currentAddressController,
                                                        TextInputType.text),
                                                    adminTextField(
                                                        personalInfo
                                                            .permanentaddress!,
                                                        _permanentAddressController,
                                                        TextInputType.text),
                                                    adminTextField(
                                                        personalInfo
                                                            .passportno!,
                                                        _passportNoController,
                                                        TextInputType.text),
                                                    adminTextField(
                                                        personalInfo
                                                            .passportlocation!,
                                                        _passportLocationController,
                                                        TextInputType.text),
                                                    MyInputField(
                                                      title:
                                                          "Passport Issue Date",
                                                      hint: DateFormat.yMd()
                                                          .format(
                                                              _selectedIssueDate),
                                                      controller:
                                                          _issueDateController,
                                                      widget: IconButton(
                                                        icon: const Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed: () {
                                                          _getDateFromUser();
                                                        },
                                                      ),
                                                    ),
                                                    MyInputField(
                                                      title:
                                                          "Passport Expiry Date",
                                                      controller:
                                                          _expiryDateController,
                                                      hint: DateFormat.yMd()
                                                          .format(
                                                              _selectedExpiryDate),
                                                      widget: IconButton(
                                                        icon: const Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed: () {
                                                          _getDateFromUser();
                                                        },
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            layoutColor,
                                                      ),
                                                      onPressed: () async {
                                                        // Call the updateCollege method to update the data
                                                        await _infoController
                                                            .updatePersonalInfo(
                                                          _nameController.text,
                                                          _dobController.text,
                                                          _genderController
                                                              .text,
                                                          _nationalityController
                                                              .text,
                                                          _currentAddressController
                                                              .text,
                                                          _permanentAddressController
                                                              .text,
                                                          _passportNoController
                                                              .text,
                                                          _passportLocationController
                                                              .text,
                                                          _issueDateController
                                                              .text,
                                                          _expiryDateController
                                                              .text,
                                                          widget.id,
                                                          personalInfo.id!,
                                                        );
                                                        // Close the bottom sheet
                                                        Get.back();
                                                      },
                                                      child: const Text('SAVE'),
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
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _infoController.deletePersonalInfo(
                                        widget.id, personalInfo.id!);
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
                },
              )
            : Center(
                child: Text(
                'Details not uploaded yet',
                style: textStyle2,
              ));
      }),
    ));
  }
}

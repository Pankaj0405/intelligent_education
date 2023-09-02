import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../Widgets/input_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';

class ExperienceDetailsScreen extends StatefulWidget {
  final String id;
  const ExperienceDetailsScreen({required this.id, super.key});

  @override
  State<ExperienceDetailsScreen> createState() =>
      _ExperienceDetailsScreenState();
}

class _ExperienceDetailsScreenState extends State<ExperienceDetailsScreen> {
  final _infoController = Get.put(InfoController());
  final _organizationController = TextEditingController();
  final _addressController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _salaryController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  DateTime _selectedFromDate = DateTime.now();
  DateTime _selectedToDate = DateTime.now();

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
        _selectedFromDate = _pickerDate;
        _selectedToDate = _pickerDate;
      });
    } else {
      print("It is null or somthing is wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    _infoController.getExperienceForAdmin(widget.id);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Experiences Details',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            body: Obx(
              () => _infoController.experiences.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _infoController.experiences.length,
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
                                  Text(
                                    'Experiences Details',
                                    style: textStyle,
                                  ),
                                  cardListTile('Organization: ',
                                      experience.organization),
                                  cardListTile('Address: ', experience.address),
                                  cardListTile(
                                      'Job Title: ', experience.jobtitle),
                                  cardListTile(
                                      'Contact No.: ', experience.contactno),
                                  cardListTile(
                                      'Salary/Stipend: ', experience.salary),
                                  cardListTile('From: ', experience.datefrom),
                                  cardListTile('To: ', experience.dateto),
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
                                                          BorderRadius.circular(
                                                              20.r),
                                                      color: boxColor,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          adminTextField(
                                                              experience
                                                                  .organization,
                                                              _organizationController,
                                                              TextInputType
                                                                  .name),
                                                          adminTextField(
                                                              experience
                                                                  .address,
                                                              _addressController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              experience
                                                                  .jobtitle,
                                                              _jobTitleController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              experience
                                                                  .contactno,
                                                              _contactNoController,
                                                              TextInputType
                                                                  .phone),
                                                          adminTextField(
                                                              experience.salary,
                                                              _salaryController,
                                                              TextInputType
                                                                  .number),
                                                          MyInputField(
                                                            title: "From",
                                                            hint: DateFormat
                                                                    .yMd()
                                                                .format(
                                                                    _selectedFromDate),
                                                            controller:
                                                                _fromDateController,
                                                            widget: IconButton(
                                                              icon: const Icon(
                                                                Icons
                                                                    .calendar_today_outlined,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              onPressed: () {
                                                                _getDateFromUser();
                                                              },
                                                            ),
                                                          ),
                                                          MyInputField(
                                                            title: "To",
                                                            controller:
                                                                _toDateController,
                                                            hint: DateFormat
                                                                    .yMd()
                                                                .format(
                                                                    _selectedToDate),
                                                            widget: IconButton(
                                                              icon: const Icon(
                                                                Icons
                                                                    .calendar_today_outlined,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              onPressed: () {
                                                                _getDateFromUser();
                                                              },
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  layoutColor,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              // Call the updateCollege method to update the data
                                                              await _infoController.updateExperience(
                                                                  _organizationController
                                                                      .text,
                                                                  _addressController
                                                                      .text,
                                                                  _jobTitleController
                                                                      .text,
                                                                  _contactNoController
                                                                      .text,
                                                                  _salaryController
                                                                      .text,
                                                                  _fromDateController
                                                                      .text,
                                                                  _toDateController
                                                                      .text,
                                                                  widget.id,
                                                                  experience
                                                                      .id);

                                                              // Close the bottom sheet
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                                'SAVE'),
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
                                          _infoController.deleteExperience(
                                              widget.id, experience.id);
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
                      'Details not uploaded yet',
                      style: textStyle2,
                    )),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../Widgets/input_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';

class AcademicsDetailsScreen extends StatefulWidget {
  final String id;
  const AcademicsDetailsScreen({required this.id, super.key});

  @override
  State<AcademicsDetailsScreen> createState() => _AcademicsDetailsScreenState();
}

class _AcademicsDetailsScreenState extends State<AcademicsDetailsScreen> {
  final _infoController = Get.put(InfoController());
  final _instituteNameController = TextEditingController();
  final _academicsCountryController = TextEditingController();
  final _academicsCourseController = TextEditingController();
  final _levelController = TextEditingController();
  final _percentageController = TextEditingController();
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
    _infoController.getAcademicsForAdmin(widget.id);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Academics Details',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            body: Obx(
              () => _infoController.academics.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _infoController.academics.length,
                      itemBuilder: (context, index) {
                        final academics = _infoController.academics[index];
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
                                    'Academics Details',
                                    style: textStyle,
                                  ),
                                  cardListTile('Institute Name: ',
                                      academics.instituteName),
                                  cardListTile('Country: ', academics.country),
                                  cardListTile('Course: ', academics.course),
                                  cardListTile(
                                      'Level of Study: ', academics.level),
                                  cardListTile('Percentage/CGPA: ',
                                      academics.percentage),
                                  cardListTile('From: ', academics.fromDate),
                                  cardListTile('To: ', academics.toDate),
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
                                                              academics
                                                                  .instituteName,
                                                              _instituteNameController,
                                                              TextInputType
                                                                  .name),
                                                          adminTextField(
                                                              academics.country,
                                                              _academicsCountryController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              academics.course,
                                                              _academicsCourseController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              academics.level,
                                                              _levelController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              academics
                                                                  .percentage,
                                                              _percentageController,
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
                                                              await _infoController.updateAcademics(
                                                                  _instituteNameController
                                                                      .text,
                                                                  _academicsCountryController
                                                                      .text,
                                                                  _academicsCourseController
                                                                      .text,
                                                                  _levelController
                                                                      .text,
                                                                  _percentageController
                                                                      .text,
                                                                  _fromDateController
                                                                      .text,
                                                                  _toDateController
                                                                      .text,
                                                                  widget.id,
                                                                  academics.id);

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
                                          _infoController.deleteAcademics(
                                              widget.id, academics.id);
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

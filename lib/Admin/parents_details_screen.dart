import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';

class ParentsDetailsScreen extends StatefulWidget {
  final String id;
  const ParentsDetailsScreen({required this.id, super.key});

  @override
  State<ParentsDetailsScreen> createState() => _ParentsDetailsScreenState();
}

class _ParentsDetailsScreenState extends State<ParentsDetailsScreen> {
  final _infoController = Get.put(InfoController());
  final _fatherNameController = TextEditingController();
  final _fatherOccupationController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _motherOccupationController = TextEditingController();
  final _parentAddressController = TextEditingController();
  final _parentEmailController = TextEditingController();
  final _parentMobileNoController = TextEditingController();

  var textStyle = TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600);
  var textStyle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    _infoController.getParentInfo(widget.id);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Parents\' Details',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            body: Obx(
              () => _infoController.parentInfo.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _infoController.parentInfo.length,
                      itemBuilder: (context, index) {
                        final parentInfo = _infoController.parentInfo[index];
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
                                    'Parents\' Details',
                                    style: textStyle,
                                  ),
                                  cardListTile('Father\'s Name: ',
                                      parentInfo.fathername!),
                                  cardListTile('Father\'s Occupation: ',
                                      parentInfo.fatheroccupation!),
                                  cardListTile('Mother\'s Name: ',
                                      parentInfo.mothername!),
                                  cardListTile('Mother\'s Occupation: ',
                                      parentInfo.motheroccupation!),
                                  cardListTile(
                                      'Address: ', parentInfo.address!),
                                  cardListTile('Email: ', parentInfo.email!),
                                  cardListTile(
                                      'Mobile No: ', parentInfo.mobileno!),
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
                                                              parentInfo
                                                                  .fathername!,
                                                              _fatherNameController,
                                                              TextInputType
                                                                  .name),
                                                          adminTextField(
                                                              parentInfo
                                                                  .fatheroccupation!,
                                                              _fatherOccupationController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              parentInfo
                                                                  .mothername!,
                                                              _motherNameController,
                                                              TextInputType
                                                                  .name),
                                                          adminTextField(
                                                              parentInfo
                                                                  .motheroccupation!,
                                                              _motherOccupationController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              parentInfo
                                                                  .address!,
                                                              _parentAddressController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              parentInfo.email!,
                                                              _parentEmailController,
                                                              TextInputType
                                                                  .emailAddress),
                                                          adminTextField(
                                                              parentInfo
                                                                  .mobileno!,
                                                              _parentMobileNoController,
                                                              TextInputType
                                                                  .number),
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  layoutColor,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              // Call the updateParentInfo method to update the data
                                                              await _infoController.updateParentInfo(
                                                                  _fatherNameController
                                                                      .text,
                                                                  _fatherOccupationController
                                                                      .text,
                                                                  _motherNameController
                                                                      .text,
                                                                  _motherOccupationController
                                                                      .text,
                                                                  _parentAddressController
                                                                      .text,
                                                                  _parentEmailController
                                                                      .text,
                                                                  _parentMobileNoController
                                                                      .text,
                                                                  widget.id,
                                                                  parentInfo
                                                                      .id!);

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
                                          _infoController.deleteParentInfo(
                                              widget.id, parentInfo.id!);
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

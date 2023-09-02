import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';

class RefereeDetailsScreen extends StatefulWidget {
  final String id;
  const RefereeDetailsScreen({required this.id, super.key});

  @override
  State<RefereeDetailsScreen> createState() => _RefereeDetailsScreenState();
}

class _RefereeDetailsScreenState extends State<RefereeDetailsScreen> {
  final _infoController = Get.put(InfoController());
  final _refereeNameController = TextEditingController();
  final _refereeOrganizationController = TextEditingController();
  final _refereeRelationshipController = TextEditingController();
  final _refereeJobTitleController = TextEditingController();
  final _workMailController = TextEditingController();
  final _refereePhoneController = TextEditingController();
  final _refereeAddressController = TextEditingController();

  var textStyle = TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600);
  var textStyle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    _infoController.getRefereeForAdmin(widget.id);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Referee Details',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            body: Obx(
              () => _infoController.referee.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _infoController.referee.length,
                      itemBuilder: (context, index) {
                        final referee = _infoController.referee[index];
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
                                    'Referee Details',
                                    style: textStyle,
                                  ),
                                  cardListTile(
                                      'Referee Name: ', referee.refereeName),
                                  cardListTile(
                                      'Relationship: ', referee.relationship),
                                  cardListTile(
                                      'Organization: ', referee.organization),
                                  cardListTile('Job Title: ', referee.jobTitle),
                                  cardListTile(
                                      'Work Email: ', referee.workMail),
                                  cardListTile(
                                      'Contact No.: ', referee.contactNo),
                                  cardListTile('Address: ', referee.address),
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
                                                              referee
                                                                  .refereeName,
                                                              _refereeNameController,
                                                              TextInputType
                                                                  .name),
                                                          adminTextField(
                                                              referee
                                                                  .relationship,
                                                              _refereeRelationshipController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              referee
                                                                  .organization,
                                                              _refereeOrganizationController,
                                                              TextInputType
                                                                  .name),
                                                          adminTextField(
                                                              referee.jobTitle,
                                                              _refereeJobTitleController,
                                                              TextInputType
                                                                  .text),
                                                          adminTextField(
                                                              referee.workMail,
                                                              _workMailController,
                                                              TextInputType
                                                                  .emailAddress),
                                                          adminTextField(
                                                              referee.contactNo,
                                                              _refereePhoneController,
                                                              TextInputType
                                                                  .phone),
                                                          adminTextField(
                                                              referee.address,
                                                              _refereeAddressController,
                                                              TextInputType
                                                                  .text),
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
                                                              await _infoController.updateReferee(
                                                                  _refereeNameController
                                                                      .text,
                                                                  _refereeRelationshipController
                                                                      .text,
                                                                  _refereeOrganizationController
                                                                      .text,
                                                                  _refereeJobTitleController
                                                                      .text,
                                                                  _workMailController
                                                                      .text,
                                                                  _refereePhoneController
                                                                      .text,
                                                                  _refereeAddressController
                                                                      .text,
                                                                  widget.id,
                                                                  referee.id);

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
                                          _infoController.deleteReferee(
                                              widget.id, referee.id);
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
                      child:
                          Text('Details not uploaded yet', style: textStyle2)),
            )));
  }
}

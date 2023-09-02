import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Widgets/admin_text_field.dart';
import '../Widgets/details_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';

class EmergencyDetailsScreen extends StatefulWidget {
  final String id;
  const EmergencyDetailsScreen({required this.id, super.key});

  @override
  State<EmergencyDetailsScreen> createState() => _EmergencyDetailsScreenState();
}

class _EmergencyDetailsScreenState extends State<EmergencyDetailsScreen> {
  final _infoController = Get.put(InfoController());
  final _guardianNameController = TextEditingController();
  final _guardianGenderController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _guardianAddressController = TextEditingController();
  final _guardianPhoneController = TextEditingController();

  var textStyle = TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600);
  var textStyle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    _infoController.getEmergencyInfo(widget.id);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Details',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(
        () => _infoController.emergencyInfo.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _infoController.emergencyInfo.length,
                itemBuilder: (context, index) {
                  final emergencyInfo = _infoController.emergencyInfo[index];
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
                              'Emergency Details',
                              style: textStyle,
                            ),
                            cardListTile(
                                'Guardian\'s Name: ', emergencyInfo.fullName!),
                            cardListTile('Gender: ', emergencyInfo.gender!),
                            cardListTile(
                                'Relationship: ', emergencyInfo.relationship!),
                            cardListTile('Address: ', emergencyInfo.address!),
                            cardListTile(
                                'Mobile No: ', emergencyInfo.mobileNo!),
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
                                                        emergencyInfo.fullName!,
                                                        _guardianNameController,
                                                        TextInputType.name),
                                                    adminTextField(
                                                        emergencyInfo.gender!,
                                                        _guardianGenderController,
                                                        TextInputType.text),
                                                    adminTextField(
                                                        emergencyInfo
                                                            .relationship!,
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
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            layoutColor,
                                                      ),
                                                      onPressed: () async {
                                                        // Call the updateParentInfo method to update the data
                                                        await _infoController.updateEmergencyInfo(
                                                            _guardianNameController
                                                                .text,
                                                            _guardianGenderController
                                                                .text,
                                                            _relationshipController
                                                                .text,
                                                            _guardianAddressController
                                                                .text,
                                                            _guardianPhoneController
                                                                .text,
                                                            widget.id,
                                                            emergencyInfo.id!);

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
                                    _infoController.deleteEmergencyInfo(
                                        widget.id, emergencyInfo.id!);
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
      ),
    ));
  }
}

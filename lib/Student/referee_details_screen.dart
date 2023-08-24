import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Widgets/title_list_tile.dart';
import '../constants.dart';
import '../Widgets/details_field.dart';
import '../controllers/firestoremethods.dart';

class RefereeDetails extends StatefulWidget {
  const RefereeDetails({super.key});

  @override
  State<RefereeDetails> createState() => _RefereeDetailsState();
}

class _RefereeDetailsState extends State<RefereeDetails> {
  final _refereeNameController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _organizationController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _workEmailController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
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
                listTileFieldInfo('Referee Name: ',_refereeNameController),
                listTileFieldInfo('Relationship: ', _relationshipController),
                listTileFieldInfo('Organization: ', _organizationController),
                listTileFieldInfo('Job Title: ', _jobTitleController),
                listTileFieldInfo('Work Email: ', _workEmailController),
                listTileFieldInfo('Contact No.: ', _contactController),
                listTileFieldInfo('Address: ', _addressController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    _addRefereeInfoToDb();
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

  _addRefereeInfoToDb() async {
    if (_areFieldsEmpty()) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      await _infoController.postReferee(
          _refereeNameController.text,
          _addressController.text,
          _contactController.text,
          _jobTitleController.text,
          _organizationController.text,
          _relationshipController.text,
          _workEmailController.text
      );
    }
  }

  bool _areFieldsEmpty() {
    return _organizationController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _relationshipController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _jobTitleController.text.isEmpty ||
        _workEmailController.text.isEmpty ||
        _refereeNameController.text.isEmpty;
  }

  emptyFields() {
    _organizationController.text = "";
    _refereeNameController.text = "";
    _addressController.text ="";
    _relationshipController.text ="";
    _contactController.text = "";
    _jobTitleController.text = "";
    _workEmailController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    _infoController.getReferee();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Referee Details'),
        ),
        body:
    Obx(
    () { return ListView.builder(
        itemCount: _infoController.referee.length,
        shrinkWrap: true,
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
                    cardListTile('Referee Name: ', referee.refereeName),
                    cardListTile('Relationship: ', referee.relationship),
                    cardListTile('Organization: ', referee.organization),
                    cardListTile('Job Title: ', referee.jobTitle),
                    cardListTile('Work Email: ', referee.workMail),
                    cardListTile('Contact No.: ', referee.contactNo),
                    cardListTile('Address: ', referee.address),
                  ],
                ),
              ),
            ),
          );
          // return Padding(
          //   padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
          //   child: CheckboxListTile(
          //       activeColor: layoutColor,
          //       value: referee1,
          //       onChanged: (bool? value) {
          //         setState(() {
          //           referee1 = value!;
          //         });
          //       },
          //       title: const Text(
          //         'Experience 1',
          //         overflow: TextOverflow.ellipsis,
          //       )),
          // );
        },
      );
    }
    ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: layoutColor,
          onPressed: () {
            openBottomSheet();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

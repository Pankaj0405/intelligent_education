import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Widgets/input_field.dart';
import 'package:intelligent_education/controllers/firestoremethods.dart';
import 'package:intelligent_education/models/personal_info.dart';
import 'package:intl/intl.dart';
import '../Widgets/info_field.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  bool isDataSubmitted = false;
  final InfoController _infoController = Get.put(InfoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchExistingPersonalInfo();
  }



  DateTime _selecteddob = DateTime.now();
  DateTime _selectedissuedate = DateTime.now();
  DateTime _selectedexpirydate = DateTime.now();
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController genderController =
  TextEditingController();

  final TextEditingController nationalityController =
  TextEditingController();

  final TextEditingController currentAddressController =
  TextEditingController();

  final TextEditingController passportlocationController =
  TextEditingController();

  final TextEditingController permanentaddressController =
  TextEditingController();

  final TextEditingController passportNoController =
  TextEditingController();

  void _fetchExistingPersonalInfo() async {
   PersonalInfo? existingPersonalInfo =
   await _infoController.getFirstPersonalInfo();
print(existingPersonalInfo);
   if (existingPersonalInfo!= null) {
     // Update the input fields with the existing data
     setState(() {
       isDataSubmitted=true;
       nameController.text = existingPersonalInfo.fullname ?? '';
       _selecteddob = DateFormat.yMd().parse(existingPersonalInfo.dateofbirth ?? '');
       genderController.text = existingPersonalInfo.gender ?? '';
       nationalityController.text = existingPersonalInfo.nationality ?? '';
       currentAddressController.text = existingPersonalInfo.currentaddress ?? '';
       permanentaddressController.text = existingPersonalInfo.permanentaddress ?? '';
       passportNoController.text = existingPersonalInfo.passportno ?? '';
       passportlocationController.text = existingPersonalInfo.passportlocation ?? '';
       _selectedissuedate = DateFormat.yMd().parse(existingPersonalInfo.issuedate ?? '');
       _selectedexpirydate = DateFormat.yMd().parse(existingPersonalInfo.expirydate ?? '');
     });
   }
 }

@override
  Widget build(BuildContext context) {
   _fetchExistingPersonalInfo();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildInfoField('Full Name', nameController),
          MyInputField(
            title: "Date of Birth",
            hint:  DateFormat.yMd().format(_selecteddob),
            widget: IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                _getDateFromUser();
              },
            ),
          ),
          buildInfoField('Gender', genderController),
          buildInfoField('Nationality', nationalityController),
          buildInfoField('Current Address', currentAddressController),
          buildInfoField('Permanent Address', permanentaddressController),
          buildInfoField('Passport No', passportNoController),
          buildInfoField('Passport Issue Location', passportlocationController),
          MyInputField(
            title: "Passport Issue Date",
            hint: DateFormat.yMd().format(_selectedissuedate),
            widget: IconButton(
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
            title: "Passowrd Expiry Date",
            hint: DateFormat.yMd().format(_selectedexpirydate),
            widget: IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                _getDateFromUser();
              },
            ),
          ),

          const SizedBox(height: 16.0),
          Center(

            child: isDataSubmitted?ElevatedButton(
              onPressed: () =>null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              child: const Text('Submit'),
            ): ElevatedButton(
              onPressed: () =>_addPersonalInfoToDb(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  _addPersonalInfoToDb() async {
    if (_areFieldsEmpty()) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      PersonalInfo? existingPersonalInfo = await _infoController.getFirstPersonalInfo();
      if (existingPersonalInfo != null) {
        // Data already exists, show a message or handle as needed
        Get.snackbar("Info", "Personal information already submitted");
      } else {
        setState(() {
isDataSubmitted=true;
        });
        await _infoController.uploadPersonalInfo(
            nameController.text,
            DateFormat.yMd().format(_selecteddob),
            genderController.text,
            nationalityController.text,
            currentAddressController.text,
            permanentaddressController.text,
            passportNoController.text,
            passportlocationController.text,
            DateFormat.yMd().format(_selectedissuedate),
            DateFormat.yMd().format(_selectedexpirydate)
        );
      }
    }
  }
  bool _areFieldsEmpty() {
    return nameController.text.isEmpty ||
        genderController.text.isEmpty ||
        nationalityController.text.isEmpty ||
        currentAddressController.text.isEmpty ||
        permanentaddressController.text.isEmpty ||
        passportNoController.text.isEmpty ||
        passportlocationController.text.isEmpty;
  }
  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));
    if (_pickerDate != null) {
      setState(() {
        _selecteddob = _pickerDate;
      });
    } else {
      print("It is null or somthing is wrong");
    }
  }
}

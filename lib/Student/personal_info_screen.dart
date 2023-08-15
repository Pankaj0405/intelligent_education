import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/input_field.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';
import '../models/personal_info.dart';
import 'package:intl/intl.dart';
import '../Widgets/info_field.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

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

  DateTime _selectedDob = DateTime.now();
  DateTime _selectedIssueDate = DateTime.now();
  DateTime _selectedExpiryDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController nationalityController = TextEditingController();

  final TextEditingController currentAddressController =
      TextEditingController();

  final TextEditingController passportLocationController =
      TextEditingController();

  final TextEditingController permanentAddressController =
      TextEditingController();

  final TextEditingController passportNoController = TextEditingController();

  void _fetchExistingPersonalInfo() async {
    PersonalInfo? existingPersonalInfo =
        await _infoController.getFirstPersonalInfo();
    print(existingPersonalInfo);
    if (existingPersonalInfo != null) {
      // Update the input fields with the existing data
      setState(() {
        isDataSubmitted = true;
        nameController.text = existingPersonalInfo.fullname ?? '';
        _selectedDob =
            DateFormat.yMd().parse(existingPersonalInfo.dateofbirth ?? '');
        genderController.text = existingPersonalInfo.gender ?? '';
        nationalityController.text = existingPersonalInfo.nationality ?? '';
        currentAddressController.text =
            existingPersonalInfo.currentaddress ?? '';
        permanentAddressController.text =
            existingPersonalInfo.permanentaddress ?? '';
        passportNoController.text = existingPersonalInfo.passportno ?? '';
        passportLocationController.text =
            existingPersonalInfo.passportlocation ?? '';
        _selectedIssueDate =
            DateFormat.yMd().parse(existingPersonalInfo.issuedate ?? '');
        _selectedExpiryDate =
            DateFormat.yMd().parse(existingPersonalInfo.expirydate ?? '');
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
            hint: DateFormat.yMd().format(_selectedDob),
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
          buildInfoField('Permanent Address', permanentAddressController),
          buildInfoField('Passport No', passportNoController),
          buildInfoField('Passport Issue Location', passportLocationController),
          MyInputField(
            title: "Passport Issue Date",
            hint: DateFormat.yMd().format(_selectedIssueDate),
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
            title: "Passport Expiry Date",
            hint: DateFormat.yMd().format(_selectedExpiryDate),
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
            child: isDataSubmitted
                ? ElevatedButton(
                    onPressed: () => null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    child: const Text('Submit'),
                  )
                : ElevatedButton(
                    onPressed: () => _addPersonalInfoToDb(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(layoutColor),
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
      PersonalInfo? existingPersonalInfo =
          await _infoController.getFirstPersonalInfo();
      if (existingPersonalInfo != null) {
        // Data already exists, show a message or handle as needed
        Get.snackbar("Info", "Personal information already submitted");
      } else {
        setState(() {
          isDataSubmitted = true;
        });
        await _infoController.uploadPersonalInfo(
            nameController.text,
            DateFormat.yMd().format(_selectedDob),
            genderController.text,
            nationalityController.text,
            currentAddressController.text,
            permanentAddressController.text,
            passportNoController.text,
            passportLocationController.text,
            DateFormat.yMd().format(_selectedIssueDate),
            DateFormat.yMd().format(_selectedExpiryDate));
      }
    }
  }

  bool _areFieldsEmpty() {
    return nameController.text.isEmpty ||
        genderController.text.isEmpty ||
        nationalityController.text.isEmpty ||
        currentAddressController.text.isEmpty ||
        permanentAddressController.text.isEmpty ||
        passportNoController.text.isEmpty ||
        passportLocationController.text.isEmpty;
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));
    if (_pickerDate != null) {
      setState(() {
        _selectedDob = _pickerDate;
      });
    } else {
      print("It is null or somthing is wrong");
    }
  }
}

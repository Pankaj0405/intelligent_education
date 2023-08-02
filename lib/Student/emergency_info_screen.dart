import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/controllers/firestoremethods.dart';
import 'package:intelligent_education/models/emergency_info.dart';
import '../Widgets/info_field.dart';

class EmergencyInfoScreen extends StatefulWidget {

  @override
  State<EmergencyInfoScreen> createState() => _EmergencyInfoScreenState();
}

class _EmergencyInfoScreenState extends State<EmergencyInfoScreen> {
  bool isDataSubmitted = false;
  final InfoController _infoController = Get.put(InfoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchExistingEmergencyInfo();
  }
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController genderController =
  TextEditingController();

  final TextEditingController relationController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();
  void _fetchExistingEmergencyInfo() async {
    EmergencyInfo? existingEmergencyInfo =
    await _infoController.getFirstEmergencyInfo();
    print(existingEmergencyInfo);
    if (existingEmergencyInfo!= null) {
      // Update the input fields with the existing data
      setState(() {
        isDataSubmitted=true;
        nameController.text = existingEmergencyInfo.fullname ?? '';
        genderController.text = existingEmergencyInfo.gender ?? '';
        relationController.text = existingEmergencyInfo.relationship ?? '';
        addressController.text = existingEmergencyInfo.address ?? '';
        phoneController.text = existingEmergencyInfo.mobileno ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchExistingEmergencyInfo();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Emergency Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildInfoField('Name of Guardian', nameController),
          buildInfoField('Gender', genderController),
          buildInfoField('Relationship', relationController),
          buildInfoField('Address', addressController),
          buildInfoField('Phone', phoneController),
          const SizedBox(height: 16.0),
          Center(
            child: isDataSubmitted?ElevatedButton(
              onPressed: () =>null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              child: const Text('Submit'),
            ): ElevatedButton(
              onPressed: () =>_addEmergencyInfoToDb(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
  _addEmergencyInfoToDb() async {
    if (_areFieldsEmpty()) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      EmergencyInfo? existingEmergencyInfo = await _infoController.getFirstEmergencyInfo();
      if (existingEmergencyInfo != null) {
        // Data already exists, show a message or handle as needed
        Get.snackbar("Info", "Parent information already submitted");
      } else {
        setState(() {
          isDataSubmitted=true;
        });
        await _infoController.uploadEmergencyInfo(
            nameController.text,
            genderController.text,
relationController.text,
            addressController.text,
            phoneController.text,
        );
      }
    }
  }
  bool _areFieldsEmpty() {
    return nameController.text.isEmpty ||
        genderController.text.isEmpty ||
        relationController.text.isEmpty ||
        addressController.text.isEmpty ||
        phoneController.text.isEmpty;
  }
}

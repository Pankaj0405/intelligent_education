import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controllers/firestoremethods.dart';
import '../models/parent_info.dart';
import '../Widgets/info_field.dart';

class ParentsInfoScreen extends StatefulWidget {
  const ParentsInfoScreen({super.key});

  @override
  State<ParentsInfoScreen> createState() => _ParentsInfoScreenState();
}

class _ParentsInfoScreenState extends State<ParentsInfoScreen> {
  bool isDataSubmitted = false;
  final InfoController _infoController = Get.put(InfoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchExistingParentInfo();
  }

  final TextEditingController fatherNameController = TextEditingController();

  final TextEditingController fatherOccupationController =
      TextEditingController();

  final TextEditingController motherNameController = TextEditingController();

  final TextEditingController motherOccupationController =
      TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  void _fetchExistingParentInfo() async {
    ParentInfo? existingParentInfo = await _infoController.getFirstParentInfo();
    print(existingParentInfo);
    if (existingParentInfo != null) {
      // Update the input fields with the existing data
      setState(() {
        isDataSubmitted = true;
        fatherNameController.text = existingParentInfo.fathername ?? '';
        fatherOccupationController.text =
            existingParentInfo.fatheroccupation ?? '';
        motherNameController.text = existingParentInfo.mothername ?? '';
        motherOccupationController.text =
            existingParentInfo.motheroccupation ?? '';
        addressController.text = existingParentInfo.address ?? '';
        emailController.text = existingParentInfo.email ?? '';
        mobileController.text = existingParentInfo.mobileno ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchExistingParentInfo();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Parents\' Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildInfoField('Father\'s Name', fatherNameController),
          buildInfoField('Father\'s Occupation', fatherOccupationController),
          buildInfoField('Mother\'s Name', motherNameController),
          buildInfoField('Mother\'s Occupation', motherOccupationController),
          buildInfoField('Address', addressController),
          buildInfoField('Email', emailController),
          buildInfoField('Mobile Number', mobileController),
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
                    onPressed: () => _addParentInfoToDb(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(layoutColor),
                    ),
                    child: const Text('Submit'),
                  ),
          )
        ],
      ),
    );
  }

  _addParentInfoToDb() async {
    if (_areFieldsEmpty()) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      ParentInfo? existingParentInfo =
          await _infoController.getFirstParentInfo();
      if (existingParentInfo != null) {
        // Data already exists, show a message or handle as needed
        Get.snackbar("Info", "Parent information already submitted");
      } else {
        setState(() {
          isDataSubmitted = true;
        });
        await _infoController.uploadParentInfo(
            fatherNameController.text,
            fatherOccupationController.text,
            motherNameController.text,
            motherOccupationController.text,
            addressController.text,
            emailController.text,
            mobileController.text);
      }
    }
  }

  bool _areFieldsEmpty() {
    return fatherNameController.text.isEmpty ||
        fatherOccupationController.text.isEmpty ||
        motherNameController.text.isEmpty ||
        motherOccupationController.text.isEmpty ||
        addressController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty;
  }
}

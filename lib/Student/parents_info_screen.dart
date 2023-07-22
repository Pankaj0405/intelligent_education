import 'package:flutter/material.dart';
import '../Widgets/info_field.dart';

class ParentsInfoScreen extends StatelessWidget {
  final TextEditingController fatherNameController =
  TextEditingController(text: 'John Doe');
  final TextEditingController fatherOccupationController =
  TextEditingController(text: 'Engineer');
  final TextEditingController motherNameController =
  TextEditingController(text: 'Jane Doe');
  final TextEditingController motherOccupationController =
  TextEditingController(text: 'Doctor');
  final TextEditingController addressController =
  TextEditingController(text: '123 Main St');
  final TextEditingController emailController =
  TextEditingController(text: 'example@example.com');
  final TextEditingController mobileController =
  TextEditingController(text: '1234567890');

  @override
  Widget build(BuildContext context) {
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
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Widgets/info_field.dart';

class EmergencyInfoScreen extends StatelessWidget {

  final TextEditingController nameController =
  TextEditingController(text: 'Jane Stew');
  final TextEditingController genderController =
  TextEditingController(text: 'Female');
  final TextEditingController relationController =
  TextEditingController(text: 'mom');
  final TextEditingController addressController =
  TextEditingController(text: '123 Main St');
  final TextEditingController emailController =
  TextEditingController(text: 'example@example.com');
  final TextEditingController phoneController =
  TextEditingController(text: '1234567890');

  @override
  Widget build(BuildContext context) {
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
          buildInfoField('Email', emailController),
          buildInfoField('Phone', phoneController),
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

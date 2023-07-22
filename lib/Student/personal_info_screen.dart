import 'package:flutter/material.dart';
import '../Widgets/info_field.dart';

class PersonalInfoScreen extends StatelessWidget {
  final TextEditingController nameController =
  TextEditingController(text: 'Raj');
  final TextEditingController dobController =
  TextEditingController(text: '1990-01-01');
  final TextEditingController genderController =
  TextEditingController(text: 'Male');
  final TextEditingController nationalityController =
  TextEditingController(text: 'USA');
  final TextEditingController addressController =
  TextEditingController(text: '123 Main St');
  final TextEditingController passportController =
  TextEditingController(text: 'ABC123');
  final TextEditingController fromDateController =
  TextEditingController(text: '2022-01-01');
  final TextEditingController toDateController =
  TextEditingController(text: '2022-12-31');
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
            'Personal Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildInfoField('Full Name', nameController),
          buildInfoField('Date of Birth', dobController),
          buildInfoField('Gender', genderController),
          buildInfoField('Nationality', nationalityController),
          buildInfoField('Address', addressController),
          buildInfoField('Passport Location', passportController),
          buildInfoField('From', fromDateController),
          buildInfoField('To', toDateController),
          buildInfoField('Email', emailController),
          buildInfoField('Phone', phoneController),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

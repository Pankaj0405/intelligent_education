import 'package:flutter/material.dart';
import '../Widgets/info_field.dart';

class ReferenceInfoScreen extends StatelessWidget {
  final TextEditingController nameController =
  TextEditingController(text: 'Name');
  final TextEditingController addressController =
  TextEditingController(text: '123 Main St');
  final TextEditingController relationController =
  TextEditingController(text: 'uncle');
  final TextEditingController emailController =
  TextEditingController(text: 'example@example.com');
  final TextEditingController phoneController =
  TextEditingController(text: '1234567890');
  final TextEditingController organizationController =
  TextEditingController(text: 'ABC organization');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reference Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildInfoField('Name', nameController),
          buildInfoField('Address', addressController),
          buildInfoField('Organization', organizationController),
          buildInfoField('Relation', relationController),
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

  // Widget buildInfoField(String label, TextEditingController controller) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 8.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           label,
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         TextField(
  //           controller: controller,
  //           // enabled: false,
  //           decoration: InputDecoration(
  //             filled: true,
  //             fillColor: Colors.grey[200],
  //             // borderRadius: BorderRadius.circular(8.0),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildDateField(String label, TextEditingController controller) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 8.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           label,
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         TextField(
  //           controller: controller,
  //           // enabled: false,
  //           decoration: InputDecoration(
  //             filled: true,
  //             fillColor: Colors.grey[200],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';

Widget buildInfoField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: controller,
          // enabled: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],


          ),
        ),
      ],
    ),
  );
}

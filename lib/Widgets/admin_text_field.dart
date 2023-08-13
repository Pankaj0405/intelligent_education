import 'package:flutter/material.dart';

Widget adminTextField (String text, TextEditingController controller, TextInputType type) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 10.0, horizontal: 25.0),
    child: TextField(
      textAlign: TextAlign.center,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.white70,
        contentPadding: const EdgeInsets.all(16),
      ),
    ),
  );
}
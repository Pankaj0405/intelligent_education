import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget adminTextField(
    String text, TextEditingController controller, TextInputType type) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 25.0.w),
    child: TextField(
      textAlign: TextAlign.center,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontSize: 16.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.white70,
        contentPadding: EdgeInsets.all(16.r),
      ),
    ),
  );
}

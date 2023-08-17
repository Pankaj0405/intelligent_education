import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget titleListTile(String title) {
  return ListTile(
    leading: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
    ),
    trailing: const Icon(
      Icons.add_circle_outline,
      color: Colors.black,
    ),
  );
}

Widget editListTile() {
  return ListTile(
    leading: Text(
      'Edit/Remove',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
    ),
    trailing: const Icon(
      Icons.edit_note,
      color: Colors.black,
    ),
  );
}

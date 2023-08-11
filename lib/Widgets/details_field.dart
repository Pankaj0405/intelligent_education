import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listTileFieldInfo(String text)  {
  return Expanded(
    flex: 0,
    child: ListTile(
      leading: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: SizedBox(
        height: 30.h,
        width: 150.w,
        child: TextField(
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    ),
  );
}
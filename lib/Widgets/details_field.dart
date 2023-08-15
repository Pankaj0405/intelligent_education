import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listTileFieldInfo(String text) {
  return Expanded(
    flex: 0,
    child: ListTile(
      leading: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: SizedBox(
        height: 30.h,
        width: 120.w,
        child: TextField(
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.blue,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 5.w,
                right: 5.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    ),
  );
}

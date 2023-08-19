import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listTileFieldInfo(String text) {
  return Expanded(
    flex: 0,
    child: ListTile(
      leading: Text(
        text,
        style: TextStyle(fontSize: 18.sp),
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
                borderRadius: BorderRadius.circular(10.r),
              )),
        ),
      ),
    ),
  );
}

Widget cardListTile(String title, String value) {
  return Padding(
    padding: EdgeInsets.only(
      left: 20.w,
      right: 10.w,
      top: 10.h,
    ),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),)),
        Expanded(child: Text(value, style: TextStyle(fontSize: 18.sp),))
      ],
    ),
  );
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notification';
  @override
  _NotificationState createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<NotificationScreen> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.bell,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          bottom: 120.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: boxColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                  hintText: "Category",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.sp),
              height: 120.h,
              child: Center(
                child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        // DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: TextField(
                maxLines: 8,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                  hintText: "Message",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 44.h,
                margin: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    color: layoutColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SEND",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/api/send_notification.dart';
import 'package:intl/intl.dart';
import '../controllers/auth_controller.dart';
import '../constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  _NotificationState createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<NotificationScreen> {
  final _authController = Get.put(AuthController());

  TextEditingController dateController = TextEditingController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  void emptyFields() {
    _titleController.text = "";
    dateController.text = "";
    _messageController.text = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Notifications",
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            bottom: 200.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: boxColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: TextField(
                  controller: _titleController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                    hintText: "Title",
                    // labelText: "Title",
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(15.sp),
              //   height: 120.h,
              //   child: Center(
              //     child: TextField(
              //       controller:
              //           dateController, //editing controller of this TextField
              //       decoration: InputDecoration(
              //           hintText: 'Date',
              //           filled: true,
              //           fillColor: Colors.white70,
              //           border: OutlineInputBorder(
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(20.sp)),
              //             borderSide: const BorderSide(color: Colors.black),
              //           ),
              //           icon: const Icon(
              //             Icons.calendar_today,
              //             color: Colors.black,
              //           ), //icon of text field
              //           labelText: "Enter Date" //label text of field
              //           ),
              //       readOnly:
              //           true, //set it true, so that user will not able to edit text
              //       onTap: () async {
              //         DateTime? pickedDate = await showDatePicker(
              //             context: context,
              //             initialDate: DateTime.now(),
              //             firstDate: DateTime.now(),
              //             // DateTime(2000), //DateTime.now() - not to allow to choose before today.
              //             lastDate: DateTime(2101));
              //
              //         if (pickedDate != null) {
              //           print(
              //               pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              //           String formattedDate =
              //               DateFormat('yyyy-MM-dd').format(pickedDate);
              //           print(
              //               formattedDate); //formatted date output using intl package =>  2021-03-16
              //           //you can implement different kind of Date Format here according to your requirement
              //
              //           setState(() {
              //             dateController.text =
              //                 formattedDate; //set output date to TextField value.
              //           });
              //         } else {
              //           print("Date is not selected");
              //         }
              //       },
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: TextField(
                  controller: _messageController,
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
                onTap: () {
                  sendNotificationToAll(
                    _titleController.text,
                    _messageController.text,
                  );
                  _authController.sendNotification(_titleController.text,
                      _messageController.text);
                  emptyFields();
                },
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                      color: layoutColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
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
      ),
    );
  }
}

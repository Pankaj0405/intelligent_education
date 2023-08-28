import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    _authController.getNotification();
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notifications'),
          ),
          body: Obx(() {
            return ListView.builder(
              shrinkWrap: true,
                itemCount: _authController.notification.length,
                itemBuilder: (context, index) {
                  final notification = _authController.notification[index];
                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    color: Colors.white70,
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.w,
                            ),
                            child: Text(notification.title, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.w,
                            ),
                            child: Text(notification.message, maxLines: 15,style: TextStyle(fontSize: 20.sp, color: Colors.black54)),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
        ),
    );
  }
}

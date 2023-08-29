import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as tego;

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
          body: Obx(
                () => ListView.builder(
              itemCount: _authController.notifications.length,
              itemBuilder: (context, index) {
                final notification = _authController.notifications[index];
                final notificationTimestamp = notification['scheduledTime'] as String;
                // final dateTime = scheduledTime.toDate();
                final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(notificationTimestamp));
                final formattedTime = DateFormat('HH:mm').format(DateTime.parse(notificationTimestamp));

                return Column(
                  children: [
                    if (index == 0 ||
                        formattedDate !=
                            DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(_authController
                                    .notifications[index - 1]['scheduledTime'] as String)))
                      Text(
                        formattedDate,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ListTile(
                      title: Text(notification['title']),
                      subtitle: Text(notification['body']),
                      trailing: Text(
                        tego.format(notification['timestamp'].toDate(),locale: 'en'),
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
    );
  }
}

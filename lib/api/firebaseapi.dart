import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intelligent_education/services/notification.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async
{
  await Future.delayed(Duration(seconds: 5));
  print('Title: ${message.notification?.title}');
  print("hello");
  await NotificationService.configureLocalTimeZone();
  await NotificationService.zonedScheduleNotification();
}
class FirebaseApi{  
  FirebaseMessaging _firebaseMessaging=FirebaseMessaging.instance;

  Future<void> initNotification()async{
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );
    final fCMToken= await _firebaseMessaging.getToken();
    print('Token $fCMToken');
    await _firebaseMessaging.subscribeToTopic('all');
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    try {
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    }
    catch(e){
      print(e.toString());
    }
    }
}
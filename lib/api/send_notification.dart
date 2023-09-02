import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendNotificationToAll(String title, String message) async {
  const String serverToken = 'AAAA6wFminY:APA91bG5cqF_lNnRpY7n9CzMCfkuCDA4slQ4sEd-51rA4iFsO1TGKw8_fv6o-XPZVPijO__M67UfSahbGrB4mUgz1ZTkE6q0sq2bJ0vQY452TGqxLW-p5Wzx7cvEgVIJbVzmQtzACYli';
  const String url = 'https://fcm.googleapis.com/fcm/send';

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverToken',
  };

  final body = {
    'notification': {'title': title, 'body': message},
    'to': '/topics/all',
  };

  final response = await http.post(Uri.parse(url),
    headers: headers,
    body: json.encode(body),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully.');
  } else {
    print('Error sending notification. Status code: ${response.statusCode}');
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  String title;
  String date;
  String message;

  Notification({
    required this.title,
    required this.date,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "message": message,
      };

  static Notification fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Notification(
        title: snapshot["title"],
        date: snapshot["date"],
        message: snapshot["message"]);
  }
}

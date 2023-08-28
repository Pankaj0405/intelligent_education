import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  String title;
  String message;
  String id;

  Notification({
    required this.title,
    required this.message,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        'id': id,
      };

  static Notification fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Notification(
      title: snapshot["title"],
      message: snapshot["message"],
      id: snapshot['id'],
    );
  }
}

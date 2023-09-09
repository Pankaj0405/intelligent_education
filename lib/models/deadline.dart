import 'package:cloud_firestore/cloud_firestore.dart';

class Deadline{
  String id;
  String deadline;

  Deadline({required this.id, required this.deadline});

  Map<String, dynamic> toJson() => {
    "deadline": deadline,
    'id': id,
  };

  static Deadline fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Deadline(
      deadline: snapshot["deadline"],
      id: snapshot['id'],
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentDetails {
  String? docName;
  String? docUrl;

  DocumentDetails({required this.docName, required this.docUrl});

  Map<String, dynamic> toJson() => {"docName": docName, "docUrl": docUrl};
  static DocumentDetails fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return DocumentDetails(docName: snapshot['docName'], docUrl: snapshot['docUrl']);
  }
}

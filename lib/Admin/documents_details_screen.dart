import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentsDetailsScreen extends StatefulWidget {
  final String id;
  const DocumentsDetailsScreen({required this.id,super.key});

  @override
  State<DocumentsDetailsScreen> createState() => _DocumentsDetailsScreenState();
}

class _DocumentsDetailsScreenState extends State<DocumentsDetailsScreen> {
  var textStyle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(child: Text('Documents not uploaded yet', style: textStyle2,)),
    ));
  }
}

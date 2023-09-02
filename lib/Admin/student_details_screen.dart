import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './academics_details_screen.dart';
import './documents_details_screen.dart';
import './emergency_details_screen.dart';
import './parents_details_screen.dart';
import './personal_details_screen.dart';
import './referee_details_screen.dart';
import './experience_details_screen.dart';

class StudentDetailsScreen extends StatefulWidget {
  final String id;
  final String name;
  const StudentDetailsScreen({required this.id, required this.name, super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.name.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          body: Column(
            children: [
              _detailsScreenCards('Personal Details',
                  () => Get.to(PersonalDetailsScreen(id: widget.id))),
              _detailsScreenCards('Parents\' Details',
                  () => Get.to(ParentsDetailsScreen(id: widget.id))),
              _detailsScreenCards('Emergency Details',
                  () => Get.to(EmergencyDetailsScreen(id: widget.id))),
              _detailsScreenCards('Documents Details',
                  () => Get.to(DocumentsDetailsScreen(id: widget.id))),
              _detailsScreenCards('Academics Details',
                  () => Get.to(AcademicsDetailsScreen(id: widget.id))),
              _detailsScreenCards('Experiences Details',
                  () => Get.to(ExperienceDetailsScreen(id: widget.id))),
              _detailsScreenCards('Referee Details',
                  () => Get.to(RefereeDetailsScreen(id: widget.id))),
            ],
          )),
    );
  }

  Widget _detailsScreenCards(String text, Function() onTap) {
    return Expanded(
      flex: 0,
      child: InkWell(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          color: Colors.white70,
          elevation: 10,
          child: ListTile(
            leading: Text(
              text,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}

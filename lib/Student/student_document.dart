import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class StudentDocument extends StatefulWidget {
  const StudentDocument({super.key});
  static const routeName = '/student-document';

  @override
  State<StudentDocument> createState() => _StudentDocumentState();
}

class _StudentDocumentState extends State<StudentDocument> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  // File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        fileName = result!.files.first.name;
        // fileToDisplay = File(result!.files.first.toString()); // path for displaying image(use whenever required)
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
        leading: const Icon(Icons.school),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upload Documents',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 20.h,
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Document: ',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            pickFile();
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: const Text('Select'),
                          ),
                        ),
                  if (result != null)
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        fileName.toString(),
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 20.h,
              ),
            ),
            Expanded(
              flex: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: layoutColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    )),
                onPressed: () {
                  result = null;
                  setState(() {});
                },
                child: Text(
                  'UPLOAD',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 20.h,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Delete',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text('Download',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          Text('Document Name',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          Text('Status',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Divider(
                        height: 10.h,
                        thickness: 1.5.h,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.delete),
                                    const SizedBox(),
                                    GestureDetector(
                                        onTap: () {},
                                        child: const Text('View')),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    SizedBox(
                                        width: 100.w,
                                        child: const Text(
                                          'Document Name',
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    const Text('Status'),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

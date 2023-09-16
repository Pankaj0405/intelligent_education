import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/Student/pdf_viewer.dart';
import 'package:intelligent_education/controllers/firestoremethods.dart';
import 'package:path_provider/path_provider.dart';
import '../constants.dart';

class StudentDocument extends StatefulWidget {

  const StudentDocument({super.key});
  static const routeName = '/student-document';

  @override
  State<StudentDocument> createState() => _StudentDocumentState();
}

class _StudentDocumentState extends State<StudentDocument> {
  String remotePDFpath = "";
  final _infoController = Get.put(InfoController());
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
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile=result!.files.first;
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
    remotePDFpath = "";
    _infoController.getDocuments();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
        // leading: const Icon(Icons.school),
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
                onPressed: () async {
                  print(pickedFile!.path);
                  await _infoController.uploadDocument(File(pickedFile!.path!), fileName!);

                  setState(() {
fileName='';
pickedFile=null;
                  });
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
    Obx(
    () {
     return Expanded(
        child: SizedBox(
          child: ListView.builder(
              itemCount: _infoController.documents.length,
              itemBuilder: (BuildContext context, int index) {
                final document = _infoController.documents[index];
                print(document.docName);
                print(document.docUrl);
                return Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                       Icon(Icons.delete),
                       SizedBox(),
                      GestureDetector(
                          onTap: () async {

                           await createFileOfPdfUrl(document.docUrl.toString()).then((f) {
                              setState(() {
                                remotePDFpath = f.path;
                                print(remotePDFpath);
                              });
                            });
  await                          Get.to(()=>PDFScreen(path:remotePDFpath,));
  remotePDFpath='';
                          },
                          child: Text('View')),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                          width: 100.w,
                          child: Text(
                           document.docName==null?'':document.docName!,
                            overflow: TextOverflow.ellipsis,
                          )),

                    ],
                  ),
                );
              }),
        ),
      );
    }
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
  Future<File> createFileOfPdfUrl(String url) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";

      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}

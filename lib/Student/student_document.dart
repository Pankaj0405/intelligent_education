import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title:const Text('Document'),
        centerTitle: true,
        leading:const Icon(Icons.school),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Upload Document',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
            ),
           const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Document: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                isLoading? const CircularProgressIndicator():
                GestureDetector(
                  onTap: () {
                    pickFile();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Select'),
                  ),
                ),
                if(result != null)
                  SizedBox(
                    width: 70,
                    child: Text(fileName.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
              onPressed: (){},
              child: const Text('UPLOAD',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[400],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Delete',style: TextStyle(fontWeight: FontWeight.w700),),
                      Text('Download',style: TextStyle(fontWeight: FontWeight.w700)),
                      Text('Document Name',style: TextStyle(fontWeight: FontWeight.w700)),
                      Text('Status',style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.delete),
                                  const SizedBox(),
                                  GestureDetector(
                                      onTap: () {},
                                      child: const Text('View')),
                                  const SizedBox(width: 2,),
                                  const SizedBox(
                                      width: 100,
                                      child: Text('Document Name',overflow: TextOverflow.ellipsis,)),
                                  const Text('Status'),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

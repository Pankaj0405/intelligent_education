import 'dart:io';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/auth_controller.dart';
import '../controllers/firestoremethods.dart';
import '../constants.dart';
import './personal_info_screen.dart';
import './parents_info_screen.dart';
import './emergency_info_screen.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  _StudentDetailsScreenState createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _authController = Get.put(AuthController());
  final _infoController = Get.put(InfoController());
  int _selectedIndex = 0;
  File? image;
  final List<Widget> _widgetOptions = [
    const PersonalInfoScreen(),
    const ParentsInfoScreen(),
    const EmergencyInfoScreen(),
  ];

  Future _getImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        _infoController.uploadToStorage(this.image!);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future _getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        _infoController.uploadToStorage(this.image!);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.2,
          maxWidth: double.infinity,
        ),
        context: context,
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                onPressed: () {
                  _getImageFromCamera();
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.camera,
                  size: 70.h,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                onPressed: () {
                  _getImageFromGallery();
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  FontAwesomeIcons.image,
                  size: 70.h,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width * 0.2;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Personal Details"),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => GestureDetector(
                  onTap: () {
                    _infoController.profilePhotoGet.value == null
                        ? _showBottomSheet()
                        : null;
                  },
                  child: _infoController.profilePhotoGet.value == null
                      ? CircleAvatar(
                          radius: radius,
                          backgroundImage:
                              (image != null) ? FileImage(image!) : null,
                          child: (image != null)
                              ? null
                              : Icon(
                                  Icons.person,
                                  size: MediaQuery.of(context).size.width * 0.2,
                                  color: Colors.white,
                                ),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              _infoController.profilePhotoGet.value!),
                          radius: radius,
                        )),
            ),
            // SizedBox(height: 10),
            Obx(
              () => Text(
                _authController.name.value.toString().toUpperCase(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            // MainAxisAlignment.spaceEvenly,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: layoutColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: const Text('Personal\n    Info'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: layoutColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: const Text("Parents'\n    Info"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: layoutColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: const Text('Emergency\n    Info'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

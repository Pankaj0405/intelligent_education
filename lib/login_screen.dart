import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intelligent_education/constants.dart';
import 'package:intelligent_education/controllers/auth_controller.dart';
import 'package:intelligent_education/reset_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => StudentState();
}

class StudentState extends State<LoginScreen> {
  final _authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'images/imgbg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                    MediaQuery.of(context).padding.top.toDouble() * 1),
                // const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 50.r,
                      child: Icon(
                        FontAwesomeIcons.user,
                        size: 60.r,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: emailController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(),
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          _authController.loginUser(
                              emailController.text, passController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: layoutColor,
                            padding: const EdgeInsets.all(10.0),
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t remember Password?'),
                        TextButton(
                          onPressed: () {
                            Get.to(ResetPassword());
                          },
                          child: const Text(
                            'Click here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xFF3571E9),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

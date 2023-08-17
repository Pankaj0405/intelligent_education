import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/admin_text_field.dart';
import '../constants.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reset Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.lock_reset,
            size: 30.r,
          ),
        ),
        body: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 10.w,
                ),
                child: Text(
                  'Reset Your Password',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.only(
                top: 20.h,
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: boxColor,
              ),
              child: Column(
                children: [
                  adminTextField('Enter Password', _passController,
                      TextInputType.visiblePassword),
                  adminTextField('Confirm Password', _confirmPassController,
                      TextInputType.visiblePassword),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: layoutColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Text('RESET', style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_education/Widgets/title_list_tile.dart';
import '../constants.dart';
import '../Widgets/details_field.dart';

class RefereeDetails extends StatefulWidget {
  const RefereeDetails({super.key});

  @override
  State<RefereeDetails> createState() => _RefereeDetailsState();
}

class _RefereeDetailsState extends State<RefereeDetails> {
  bool referee1 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Referee Details'),
          // leading: const Icon(FontAwesomeIcons.idBadge),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              titleListTile('Referee'),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                // height: MediaQuery.of(context).size.height * 0.70,
                child: Column(
                  children: [
                    listTileFieldInfo('Referee Name: '),
                    listTileFieldInfo('Relationship: '),
                    listTileFieldInfo('Organization: '),
                    listTileFieldInfo('Job Title: '),
                    listTileFieldInfo('Work Email: '),
                    listTileFieldInfo('Contact No.: '),
                    listTileFieldInfo('Address: '),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                          backgroundColor: layoutColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          )),
                      child: const Text('SUBMIT'),
                    ),
                  ],
                ),
              ),
              editListTile(),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: boxColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          // focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, int) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                            child: CheckboxListTile(
                                activeColor: layoutColor,
                                value: referee1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    referee1 = value!;
                                  });
                                },
                                title: const Text(
                                  'Experience 1',
                                  overflow: TextOverflow.ellipsis,
                                )),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    // const Divider(height: 0),
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

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          centerTitle: true,
          leading: const Icon(FontAwesomeIcons.idBadge),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                leading: Text(
                  'Referee',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          backgroundColor: layoutColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: const Text('SUBMIT'),
                    ),
                  ],
                ),
              ),
              const ListTile(
                leading: Text(
                  'Edit/Remove',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.edit_note,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                            borderRadius: BorderRadius.circular(20),
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
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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

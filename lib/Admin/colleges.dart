import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_education/Widgets/admin_text_field.dart';

class College extends StatefulWidget {
  const College({super.key});
  static const routeName = '/college';

  @override
  State<College> createState() => CollegeState();
}

class CollegeState extends State<College> {
  bool college1 = true;
  bool college2 = true;
  bool college3 = true;

  final _collegeNameController = TextEditingController();
  final _addressController = TextEditingController();
  // void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            leading: const Icon(Icons.school),
            title: const Text(
              "Colleges",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  // letterSpacing: 2.0,
                  // wordSpacing: 4.0),
            ),),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 30),

              // Heading 1
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(10, 0, 170, 0),
              //   child: Text(
              //     "Add College",
              //     style: TextStyle(
              //         // fontFamily: 'Pacifico',
              //         fontWeight: FontWeight.bold,
              //         fontSize: 25.0,
              //         letterSpacing: 2.0,
              //         wordSpacing: 4.0),
              //   ),
              // ),
              const ListTile(
                leading: Text(
                  'Add Course',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
              ),
              // const SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                // padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: Column(
                  children: [
                    // College Name
                    adminTextField('College Name', _collegeNameController, TextInputType.text),
                    adminTextField('Address', _addressController, TextInputType.text),
                    // Card(
                    //   color: Colors.white,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 8.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     title: TextField(
                    //       textAlign: TextAlign.center,
                    //       keyboardType: TextInputType.text,
                    //       decoration: InputDecoration(
                    //         hintText: 'College Name',
                    //         hintStyle: const TextStyle(fontSize: 16),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: const BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //         filled: true,
                    //         contentPadding: const EdgeInsets.all(16),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Address
                    // Card(
                    //   color: Colors.white,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     title: TextField(
                    //       textAlign: TextAlign.center,
                    //       keyboardType: TextInputType.text,
                    //       decoration: InputDecoration(
                    //         hintText: 'Address',
                    //         hintStyle: const TextStyle(fontSize: 16),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: const BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //         filled: true,
                    //         contentPadding: const EdgeInsets.all(16),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Deadline
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        title: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'Deadline',
                            hintStyle: const TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                        trailing: const Icon(Icons.date_range),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 0, 0, 20),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('ADD')),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 50),
              Divider(
                height: 20.h,
                color: Colors.black,
                indent: 100.w,
                endIndent: 100.w,
                thickness: 2,),
              // Heading 2
              const ListTile(
                leading: Text(
                  'Edit/Remove',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Icon(
                  Icons.edit_note,
                  color: Colors.black,
                ),
              ),

              // const SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: Column(
                  children: [
                    // Search
                    // const Card(
                    //   color: Colors.white,
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     leading: Icon(Icons.search),
                    //     title: Text('Search'),
                    //   ),
                    // ),

                    // checkbox
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
                                value: college1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    college1 = value!;
                                  });
                                },
                                title: const Text('College 1')),
                          );
                        },
                      ),
                    ),
                    // const Divider(height: 0),

                    // add/delete button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          splashColor: Colors.white,
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
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

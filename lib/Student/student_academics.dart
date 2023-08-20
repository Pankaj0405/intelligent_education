import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../Widgets/title_list_tile.dart';
import '../constants.dart';
import '../Widgets/details_field.dart';

class AcademicDetails extends StatefulWidget {
  const AcademicDetails({super.key});

  @override
  State<AcademicDetails> createState() => _AcademicDetailsState();
}

class _AcademicDetailsState extends State<AcademicDetails> {
  bool academic1 = false;
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  openBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        builder: (BuildContext context) {
          return Container(
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
                listTileFieldInfo('Institute Name: '),
                listTileFieldInfo('Country: '),
                listTileFieldInfo('Course: '),
                listTileFieldInfo('Level of Study: '),
                listTileFieldInfo('Percentage/CGPA: '),
                ListTile(
                  leading: Text('From: ', style: TextStyle(fontSize: 18.sp)),
                  trailing: SizedBox(
                    height: 30.h,
                    width: 120.w,
                    child: TextField(
                      controller:
                      fromDateController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.blue,//editing controller of this TextField
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      readOnly:
                      true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            // DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            fromDateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: Text('To: ', style: TextStyle(fontSize: 18.sp)),
                  trailing: SizedBox(
                    height: 30.h,
                    width: 120.w,
                    child: TextField(
                      controller:
                      toDateController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.blue,//editing controller of this TextField
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      readOnly:
                      true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            // DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            toDateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: layoutColor,
                      padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      )),
                  child: const Text('SUBMIT'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Academics'),
      ),
      body: Column(
        children: [
          titleListTile('Academics'),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: boxColor,
            ),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, int) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  color: Colors.white70,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        cardListTile('Institute Name: ', 'ABC company'),
                        cardListTile('Country: ', 'India'),
                        cardListTile('Course: ', 'B. Tech'),
                        cardListTile('Level of Study: ', 'Graduation'),
                        cardListTile('Percentage/CGPA: ', '8'),
                        cardListTile('From: ', '2020'),
                        cardListTile('To: ', '2024'),
                      ],
                    ),
                  ),
                );
                // return Padding(
                //   padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                //   child: CheckboxListTile(
                //       activeColor: layoutColor,
                //       value: academic1,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           academic1 = value!;
                //         });
                //       },
                //       title: const Text(
                //         'Academic 1',
                //         overflow: TextOverflow.ellipsis,
                //       )),
                // );
              },
            ),
          ),
        ],
      ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: layoutColor,
            onPressed: () {
              openBottomSheet();
            },
            child: const Icon(Icons.add),
          ),
    ),
    );
  }
}

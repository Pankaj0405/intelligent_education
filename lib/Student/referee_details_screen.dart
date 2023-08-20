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
                listTileFieldInfo('Referee Name: '),
                listTileFieldInfo('Relationship: '),
                listTileFieldInfo('Organization: '),
                listTileFieldInfo('Job Title: '),
                listTileFieldInfo('Work Email: '),
                listTileFieldInfo('Contact No.: '),
                listTileFieldInfo('Address: '),
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
          title: const Text('Referee Details'),
        ),
        body: Column(
          children: [
            titleListTile('Referee'),
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
                itemCount: 2,
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
                          cardListTile('Referee Name: ', 'ABC'),
                          cardListTile('Relationship: ', 'Uncle'),
                          cardListTile('Organization: ', 'ABC Company'),
                          cardListTile('Job Title: ', 'Human Resource'),
                          cardListTile('Work Email: ', 'abc@gmail.com'),
                          cardListTile('Contact No.: ', '942942303'),
                          cardListTile('Address: ', 'Mandawar Roorkee Uttarakhand'),
                        ],
                      ),
                    ),
                  );
                  // return Padding(
                  //   padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                  //   child: CheckboxListTile(
                  //       activeColor: layoutColor,
                  //       value: referee1,
                  //       onChanged: (bool? value) {
                  //         setState(() {
                  //           referee1 = value!;
                  //         });
                  //       },
                  //       title: const Text(
                  //         'Experience 1',
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


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget{
@override
  _NotificationState createState() {
   return _NotificationState();
 }
  }



class _NotificationState  extends State<NotificationScreen>{
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    dateinput.text = "";
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
  resizeToAvoidBottomInset : false,
appBar: AppBar(
  leading:  Icon(CupertinoIcons.bell,
      color: Colors.black,
  size: 30.sp,),
  title:  Text(
       "Notification",
   style : TextStyle(
fontWeight: FontWeight.normal,
fontFamily:"Avenir",
     color: Colors.black,
     fontSize: 25.sp,

   ),
   ),
),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.sp),
          child: TextField(
            textAlign: TextAlign.center,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.sp))
              ),

              hintText: "Category",

            ),
          ),
        ),
    Container(
    padding: EdgeInsets.all(15.sp),

    height:150,
    child:Center(
    child:TextField(
    controller: dateinput, //editing controller of this TextField
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: const BorderSide(color: Colors.black),
      ),

    icon: Icon(Icons.calendar_today,
    color: Colors.black,), //icon of text field
    labelText: "Enter Date" //label text of field
    ),
    readOnly: true,  //set it true, so that user will not able to edit text
    onTap: () async {
    DateTime? pickedDate = await showDatePicker(
    context: context, initialDate: DateTime.now(),
    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
    lastDate: DateTime(2101)
    );

    if(pickedDate != null ){
    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    print(formattedDate); //formatted date output using intl package =>  2021-03-16
    //you can implement different kind of Date Format here according to your requirement

    setState(() {
    dateinput.text = formattedDate; //set output date to TextField value.
    });
    }else{
    print("Date is not selected");
    }
    },
    ),
    ),
    ),
        Padding(
          padding: EdgeInsets.all(15.sp),
          child: TextField(
            maxLines: 8,
            textAlign: TextAlign.center,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.sp))
              ),

              hintText: "Message",

            ),
          ),
        ),
  GestureDetector(
    child: Container(
      
      height: 44.h,
      margin: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0,1)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Send",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ],
      ),
    ),
  ),
      ],
    ),
  ),
);

  }
}
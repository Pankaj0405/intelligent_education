import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';

class StudentExperience extends StatelessWidget {
  const StudentExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Experience'),
        centerTitle: true,
        leading: Icon(FontAwesomeIcons.wrench),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text('Experience',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            trailing: Icon(Icons.add_circle_outline,
              color: Colors.black,),
          ),
          ExpInfo('Organization: '),
          ExpInfo('Location: '),
          ExpInfo('Employee Id: '),
          ExpInfo('Salary: '),
          // ListTile(
          //   leading: Text('Organization: ',style: TextStyle(fontSize: 18),),
          //   trailing: SizedBox(
          //     height: 30,
          //     width: 200,
          //     child: TextField(
          //       decoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           )
          //       ),
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Text('Location: ',style: TextStyle(fontSize: 18),),
          //   trailing: SizedBox(
          //     height: 30,
          //     width: 200,
          //     child: TextField(
          //       decoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           )
          //       ),
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Text('Employee Id: ',style: TextStyle(fontSize: 18),),
          //   trailing: SizedBox(
          //     height: 30,
          //     width: 200,
          //     child: TextField(
          //       decoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           )
          //       ),
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Text('Salary: ',style: TextStyle(fontSize: 18),),
          //   trailing: SizedBox(
          //     height: 30,
          //     width: 200,
          //     child: TextField(
          //       decoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           )
          //       ),
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('From: ',style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 30,
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              Text('To: ',style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 30,
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {},
            child: Text('SUBMIT'),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),),

        ],
      ),
    ));
  }
  Widget ExpInfo (String text) {
    return ListTile(
      leading: Text(text,
        style: TextStyle(fontSize: 18),),
      trailing: SizedBox(
        height: 30,
        width: 200,
        child: TextField(
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
      ),
    );
  }
}

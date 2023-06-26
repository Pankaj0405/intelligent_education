import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Name'),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 5,
                child: Icon(FontAwesomeIcons.user,
                  color: Colors.black,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.notifications),
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[400],
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ListTile(
                            tileColor: Colors.white,
                            leading: Icon(FontAwesomeIcons.university,
                              color: Colors.black,
                              size: 30,),
                            title: Text('College Name'),
                            subtitle: Text('Course Name'),
                            trailing: CircularProgressIndicator(
                              value: 4,

                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        child: Text('     Book \nAppointment',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),)),
                    Icon(FontAwesomeIcons.solidComments,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [SizedBox(
                height: 30,
              ),
                CircleAvatar(
                  radius: 60,
                ),
                Align(child: Text('Name',style: TextStyle(fontSize: 20),),alignment: Alignment.center,),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Personal Info'),
                  trailing: Icon(Icons.edit),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Upload Document'),
                  trailing: Icon(Icons.edit),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Experience'),
                  trailing: Icon(Icons.edit),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class admin_dash extends StatefulWidget {
  const admin_dash({super.key});
  @override
  State<admin_dash> createState() => admin_dashState();
}

class admin_dashState extends State<admin_dash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intelligent Education',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          // leading: Icon(
          //   CupertinoIcons.profile_circled,
          //   color: Colors.black,
          //   size: 30,
          // ),
          leading: IconButton(
            icon: Image.asset('images/DPS.jpg'),
            
            onPressed: () {
              // Handle leading icon press
            },
          ),
          title: Text(
            "Admin Name",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Avenir",
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.chat),
              color: Colors.black,
              onPressed: () {
                // Handle chat icon press
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(30),
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Handle button press
                Navigator.pushNamed(context, 'college');
              },
              icon: Icon(Icons.school),
              label: Text('College'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle course button press
                Navigator.pushNamed(context, 'course');
              },
              icon: Icon(Icons.book),
              label: Text('Course'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle student button press
                Navigator.pushNamed(context, 'student');
              },
              icon: Icon(Icons.person),
              label: Text('Student'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle status button press
                Navigator.pushNamed(context, 'status');
              },
              icon: Icon(Icons.check),
              label: Text('Status'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle notification button press
                Navigator.pushNamed(context, 'notification');
              },
              icon: Icon(Icons.notifications),
              label: Text('Notification'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle details button press
                Navigator.pushNamed(context, 'details');
              },
              icon: Icon(Icons.info),
              label: Text('Details'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

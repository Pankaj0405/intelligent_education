import 'package:flutter/material.dart';

class admin_dash extends StatelessWidget {
  const admin_dash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intelligent Education',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 162, 255),
            title: Center(
              child: Text(
                'Admin Dashboard',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            )),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(30),
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Handle button press
              },
              icon: Icon(Icons.school),
              label: Text('College'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 162, 255),
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                // minimumSize: Size(10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle course button press
              },
              icon: Icon(Icons.book),
              label: Text('Course'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 162, 255),
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                // minimumSize: Size(10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle student button press
              },
              icon: Icon(Icons.person),
              label: Text('Student'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 162, 255),
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                // minimumSize: Size(10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle status button press
              },
              icon: Icon(Icons.check),
              label: Text('Status'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 162, 255),
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                // minimumSize: Size(10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle notification button press
              },
              icon: Icon(Icons.notifications),
              label: Text('Notification'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 162, 255),
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                // minimumSize: Size(10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle details button press
              },
              icon: Icon(Icons.info),
              label: Text('Details'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 162, 255),
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10),
                // minimumSize: Size(10, 10),
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

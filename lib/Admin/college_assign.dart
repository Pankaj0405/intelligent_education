import 'package:flutter/material.dart';

class college_assign extends StatefulWidget {
  const college_assign({super.key});

  @override
  State<college_assign> createState() => college_assignState();
}

class college_assignState extends State<college_assign> {
  String dropdownvalue = 'College 1';

  // List of items in our dropdown menu
  var items = [
    'College 1',
    'College 2',
    'College 3',
    'College 4',
    'College 5',
  ];
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "College-assign",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  wordSpacing: 4.0),
            )),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    children: [
                      // Student Name
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: ListTile(
                          title: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Student Name',
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ),

                      // College
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'College',
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ),

                      DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                        child: ElevatedButton(
                            onPressed: onPressed, child: const Text('Add')),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

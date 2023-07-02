import 'package:flutter/material.dart';

class College extends StatefulWidget {
  const College({super.key});

  @override
  State<College> createState() => CollegeState();
}

class CollegeState extends State<College> {
  bool college1 = true;
  bool college2 = true;
  bool college3 = true;

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Colleges",
              style: TextStyle(
                  // fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  wordSpacing: 4.0),
            )),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Heading 1
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 170, 0),
                  child: Text(
                    "Add College",
                    style: TextStyle(
                        // fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        wordSpacing: 4.0),
                  ),
                ),

                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    children: [
                      // College Name
                      Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: ListTile(
                          title: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'College Name',
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
                        ),
                      ),

                      // Address
                      Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Address',
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
                        ),
                      ),

                      // Deadline
                      Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
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
                        padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                        child: ElevatedButton(
                            onPressed: onPressed, child: const Text('Add')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Heading 2
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 130, 0),
                  child: Text(
                    "Edit / Remove",
                    style: TextStyle(
                        // fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        wordSpacing: 4.0),
                  ),
                ),

                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    children: [
                      // Search
                      const Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Search'),
                        ),
                      ),

                      // checkbox
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CheckboxListTile(
                            value: college1,
                            onChanged: (bool? value) {
                              setState(() {
                                college1 = value!;
                              });
                            },
                            title: const Text('College 1')),
                      ),
                      const Divider(height: 0),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CheckboxListTile(
                          value: college2,
                          onChanged: (bool? value) {
                            setState(() {
                              college2 = value!;
                            });
                          },
                          title: const Text('College 2'),
                        ),
                      ),
                      const Divider(height: 0),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CheckboxListTile(
                          value: college3,
                          onChanged: (bool? value) {
                            setState(() {
                              college3 = value!;
                            });
                          },
                          title: const Text('College 3'),
                          // isThreeLine: true,
                        ),
                      ),
                      const Divider(height: 0),

                      // add/delete button
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                              child: ElevatedButton(
                                  onPressed: onPressed,
                                  child: const Text('Edit')),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: ElevatedButton(
                                  onPressed: onPressed,
                                  child: const Text('Remove')),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => studentState();
}

class studentState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'images/bgimg.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 100,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      style: TextStyle(),
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle details button press
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10.0),
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t remember Password?'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Click here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

List pages = [];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var firebaseAuth = FirebaseAuth.instance;

var firestore = FirebaseFirestore.instance;

var authController = AuthController.instance;

Color layoutColor = const Color(0xFF7A98E5);
Color? boxColor = Colors.grey.shade100;
// const Color(0xFFDEDEDE);

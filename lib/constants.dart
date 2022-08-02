//import necessary libraries
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktoks/controllers/auth_controllers.dart';
import 'package:tiktoks/views/screens/add_video_screen.dart';
import 'package:tiktoks/views/screens/video_screen.dart';

//COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//AUTHCONTROLLER
var authController = AuthControllers.instance;

//PAGES
const pages = [
  VideoScreen(),
  Text('Search'),
  AddVideoScreen(),
  Text('Messages'),
  Text('profile'),
];

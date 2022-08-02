import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoks/constants.dart';
import 'package:tiktoks/controllers/auth_controllers.dart';
import 'package:tiktoks/views/screens/auth/login_screen.dart';
import 'package:tiktoks/views/screens/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) {
      Get.put(AuthControllers());
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      // home: Center(
      //   child: Text('This is tiktok clone'),
      // ),
      home: LoginScreen(),
    );
  }
}


//first without scaffold view and show a text
// then followed by that go for constants file that has all color and other stuffs
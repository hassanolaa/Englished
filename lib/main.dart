import 'package:elearning/HomeScreen.dart';
import 'package:elearning/SignUpScreen.dart';
import 'package:elearning/Welcome_Screen.dart';
import 'package:elearning/api/firebase_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:elearning/Profile/profile_Screen.dart';

void main() async{

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken=await FirebaseMessaging.instance.getToken();
  print(fcmToken);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome_Screen());


  }
}
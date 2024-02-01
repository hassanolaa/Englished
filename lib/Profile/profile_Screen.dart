import 'package:flutter/material.dart';


import 'package:elearning/Profile/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Profile"),
      ),
      body: Body(),

    );
  }
}

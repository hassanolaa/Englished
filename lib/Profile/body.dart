import 'package:elearning/User_Profile/HelpCenter_Page.dart';
import 'package:elearning/User_Profile/Settings_pages.dart';
import 'package:elearning/User_Profile/Vip/VIP_landingScreen.dart';
import 'package:elearning/Welcome_Screen.dart';
import 'package:flutter/material.dart';

import 'package:elearning/Profile/ProfileMenu.dart';
import 'package:elearning/Profile/Profile_pic.dart';

import '../User_Profile/UserProfile_Screen.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:NetworkImage('https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcnM4M2QyaWpwY293Mjlza2ozdTIwbW96Y3N4ZHY5cHE5NmZxaGtrdiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/4ixkk99LD8DW4qwFDT/giphy.gif'),
              fit: BoxFit.cover
          )
      ),
      child: SingleChildScrollView(

        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icon(Icons.person,color: Colors.teal,),
              press: () => {
              Navigator.push(context,MaterialPageRoute(builder:
              (contxet)=> ProfilePage()))
              },
            ),
            ProfileMenu(
              text: "VIP Subscribe",
              icon: Icon(Icons.privacy_tip,color: Colors.teal,),
              press: () {
                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> VIP_land()));
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icon(Icons.settings,color: Colors.teal,),
              press: () {
                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> SettingsPage2()));

              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icon(Icons.help,color: Colors.teal,),
              press: () {
                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> HelpCenter()));
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icon(Icons.logout,color: Colors.teal,),
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome_Screen(),));
              },
            ),
          ],
        ),
      ),
    );
  }
}
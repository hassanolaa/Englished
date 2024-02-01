import 'package:elearning/MainScreens/Contant_pages/Contant_Screen.dart';
import 'package:elearning/MainScreens/MainHome_Screen.dart';
import 'package:elearning/MainScreens/test2.dart';
import 'package:elearning/Menu.dart';
import 'package:elearning/Profile/body.dart';
import 'package:elearning/Profile/profile_Screen.dart';
import 'package:elearning/User_Profile/Vip/VIP_landingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearning/SignUpScreen.dart';
import 'package:elearning/LogInScreen.dart';
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  var Screens=[MainHome_Screen(),test2(),VIP_land(),Menu()];

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child:
    CupertinoTabScaffold(resizeToAvoidBottomInset: true,
    tabBar: CupertinoTabBar(
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(label: "Home",icon:Icon(Icons.account_balance_sharp,color: Colors.teal,)),
        BottomNavigationBarItem(label: "Contant",icon:Icon(Icons.notes,color: Colors.teal,)),
        BottomNavigationBarItem(label: "VIP",icon:Icon(Icons.privacy_tip,color: Colors.teal,)),
        BottomNavigationBarItem(label: "Profile",icon:Icon(Icons.person,color: Colors.teal,)),
      ],
    ),
      tabBuilder: (BuildContext context,int index){
     return Screens[index];
      },
    ));
  }
}

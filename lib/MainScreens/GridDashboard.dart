import 'package:elearning/MainScreens/TextToSpeech/TextToSpeech_page.dart';
import 'package:elearning/MainScreens/Translator/Translator_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../LogInScreen.dart';


class GridDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20,),
        GestureDetector(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder:
              (contxet)=> Translator_page()));},
          child: Container(
            height: 100,
            width: 100,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/talking.png', width: 42),
                  Text("Translator",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
        ),
        SizedBox(width: 30,),
        GestureDetector(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder:
              (contxet)=> TextToSpeech_Page()));},
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                      Image.asset('images/cat-lady.png', width: 42),
               Text("Dictionary",style: TextStyle(color: Colors.white),)

              ],
            ),
          ),
        ),
        SizedBox(width: 30,),
        GestureDetector(
          onTap: (){
            Fluttertoast.showToast(msg: "Coming Soon",backgroundColor: Colors.teal,textColor: Colors.white);
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                      Image.asset('images/friendship.png', width: 42),
                Text("Quizzes",style: TextStyle(color: Colors.white),)

              ],
            ),
          ),
        ),
      ],
    );

  }
}



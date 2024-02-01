import 'package:elearning/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LogInScreen.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:NetworkImage('https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMm9rMGd3emhkeGV3N2k1ajUzZWhmZWN4eDF1eDR6dGNzdnplenM5aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/LC6x4kOFae49TBZIAN/giphy.gif'),
                fit: BoxFit.cover
            )
        ),
        child:
        Column(
          children: [
            SizedBox(height: 350,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder:
                      (contxet)=> SignUpScreen()));
                },child:Text(" SignUP ",style: TextStyle(color: Colors.teal,fontSize: 35),) ,style: TextButton.styleFrom(backgroundColor: Colors.white),),
                SizedBox(width: 40,),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder:
                      (contxet)=> SignIn()));
                },child:Text(" SignIN ",style: TextStyle(color: Colors.teal,fontSize: 35),) ,style: TextButton.styleFrom(backgroundColor: Colors.white),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:elearning/HomeScreen.dart';
import 'package:elearning/User_Profile/UserProfile_Edit_Screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LogInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final auth=FirebaseAuth.instance;
  late String email;
  late String password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8ebed),
      body: SingleChildScrollView(
        //we are adding this so that we can scroll when KeyBoard PopsUp.
        child: Container(
          height: MediaQuery.of(context)
              .size
              .height, // If you get any blur that is outoff the screen then try to decrease or increase this negative value.This is mainly bcz it adjusts as per the phone size.
          alignment: Alignment.topCenter,
          child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    child: Column(
                      children: [
                        Stack(
                          //I added stack so that i can position it anywhere i want with the coordinates like left ,right,bottom.
                          children: <Widget>[
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "images/talking.png",
                                ),
                              ),
                            ),
                          ],
                        ),

                        //The Username,Email,Password Input fields.
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffe1e2e3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color(0xfff5f8fd),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color(0xfff5f8fd),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: TextFormField(
                                  onChanged: (value){
                                    email=value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color(0xfff5f8fd),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: TextFormField(
                                  onChanged: (value){
                                    password=value;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  //Raised Buttons of sigup will appear.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          try{
                            final newuser= await auth.createUserWithEmailAndPassword(email: email, password: password);
                            Navigator.push(context,MaterialPageRoute(builder:
                                (contxet)=> EditProfilePage2()));
                            print("hassan");
                            print(email);

                          }
                          catch(e){
                            print(e);
                          }

                        },
                        child: Container(width: 110,
                        height: 50,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        child: Column(
                          children: [
                            SizedBox(height:8 ,),
                            Text("SignUP",style:TextStyle(color: Colors.white,fontSize: 25),),
                          ],
                        ),
                        ),
                      ),
                    SizedBox(width: 20),
                      InkWell(        //We can use the GestureDetector as well.
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Color(0xfff5f8fd),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  //For creating like a card.
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0,
                                          18.0),
                                      blurRadius: 15.0),
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, -04.0),
                                      blurRadius: 10.0),
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  "Sign Up With",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w700),
                                ),
                                Image.asset(
                                  "images/google.png",
                                  height: 40,
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Already have an account?"),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {Navigator.push(context,MaterialPageRoute(builder:
                          (contxet)=> SignIn()));},
                      child: Container(
                        child: Text("Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.teal,
                                fontSize: 18)),
                      ),
                    )
                  ]),
                ],
              )),
        ),
      ),
    );
  }
  
  }


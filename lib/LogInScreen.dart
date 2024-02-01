import 'package:elearning/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SignUpScreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  SignInGoogle()async{
    GoogleSignInAccount? googleuser=await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth=await googleuser?.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(
      accessToken:googleAuth?.accessToken ,
      idToken:googleAuth?.idToken ,
    );
    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    if (userCredential!=null){
      Navigator.push(context,MaterialPageRoute(builder:
          (contxet)=> HomeScreen()));
    }
  }


  final auth=FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8ebed),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              70, //For moving according to the screen when the keyboard popsup.
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: 600,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("images/friendship.png"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
// From here the login Credentials start.
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              )),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
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
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
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
                                border: InputBorder.none,
                                prefixIcon:
                                Icon(Icons.vpn_key, color: Colors.grey),
                              ),
                            ),
                          ),
                        ]),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w500),
                        )),
                  ),

                  SizedBox(height: 5),

                  //From here the signin buttons will occur.

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: ()async{
                          try{  final user= await auth.signInWithEmailAndPassword(email: email, password: password);
                          if (user!=null){
                            Navigator.push(context,MaterialPageRoute(builder:
                                (contxet)=> HomeScreen()));
                          }

                          }
                          catch(e){print(e);}
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
                              Text("SignIn",style:TextStyle(color: Colors.white,fontSize: 25),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        //Signin with google button.
                        onTap:SignInGoogle,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Color(0xfff5f8fd),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    //Created this shadow for looking elevated.
                                    //For creating like a card.
                                      color: Colors.black12,
                                      offset: Offset(0.0,
                                          18.0), // This offset is for making the the lenght of the shadow and also the brightness of the black color try seeing it by changing its values.
                                      blurRadius: 15.0),
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, -04.0),
                                      blurRadius: 10.0),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // I had added main axis allignment to be center to make to be at the center.
                              children: [

                                Text(
                                  "Sign In With",
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
                      ),
                    ],
                  ),

                  SizedBox(height: 5),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 10),
                    TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder:
                        (contxet)=> SignUpScreen()));}, child:Text("Register now",style: TextStyle(color: Colors.teal),))
                  ]),
                ],
              )),
        ),
      ),
    );
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/MainScreens/GridDashboard.dart';
import 'package:elearning/MainScreens/test.dart';
import 'package:elearning/MainScreens/test2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHome_Screen extends StatefulWidget {
  const MainHome_Screen({Key? key}) : super(key: key);

  @override
  State<MainHome_Screen> createState() => _MainHome_ScreenState();
}

class _MainHome_ScreenState extends State<MainHome_Screen> {
  final _auth=FirebaseAuth.instance;

  late User signedInUser;


  String? name="";

  Future _getUserInfo() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {

          name=  snapshot.data()!["username"];


        });
      }
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
  }


  Widget listViewWidget(String name,String date,String image){
    return   Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
            image:AssetImage('images/cat-lady.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Card(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  date,
                  style:TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                ),
              ),
            ],
          ),
        ) );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:NetworkImage('https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeDV4Nno5ZG14bHY3dm45dm4zeHBwN2JrdGk0ODkyd2Z1emRkNWF3cSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/H4E7iUHYkkQiWK98WA/giphy.gif'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 105),
          //  Container(
         //     width: 220,
         //     height: 60,
         //     decoration:BoxDecoration(image: DecorationImage(image:
          //  NetworkImage('https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExa3VqYnZlY3c3ampsNGR2dTM2aWtuaWRvbDc2aDRhN2hhbGVtMGVheiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/M7ZlKRWsCsQ5QKP5NC/giphy.gif',),
          //  )) ,),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome Back",
                        style: TextStyle(color:Colors.teal,fontSize: 25,),
                      ),
                      SizedBox(height: 4),
                      Text(
                        name!,
                        style: TextStyle(color:Colors.teal,fontSize: 20,fontWeight: FontWeight.bold),

                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>test2(),));
                    },
                    alignment: Alignment.topCenter,
                    icon: Icon(CupertinoIcons.rocket,color: Colors.teal,size: 36,),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            //TODO Grid Dashboard
            GridDashboard(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                      BorderRadius.circular(20),
                    color: Colors.teal
                  ),
                  width: 180,height: 280,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment:   CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,width: 10,),
                        Text("Coming soon :",style: TextStyle(color: Colors.white,fontSize: 22),),
                      ],
                    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      ],
    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('comingsoon').snapshots(),
                        builder:(context, snapshot) {
                          List<Row> clientWidgets=[];
                          if(snapshot.hasData){
                            final clients=snapshot.data?.docs.reversed.toList();
                            for(var client in clients!){
                              final clientwidget=Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 150,
                                      height: 110,
                                      margin: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
                                          image:NetworkImage(client['image'],scale:1),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 120,
                                              height:30,
                                              margin: const EdgeInsets.all(12),
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6)),
                                              child: Text(
                                                client['name'],
                                                style: TextStyle(fontSize:12,fontWeight: FontWeight.w600, color: Colors.teal),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              height:30,
                                              margin: const EdgeInsets.all(12),
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6)),
                                              child: Text(
                                                client['date'],
                                                style:TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ) )
                                ],
                              );
                              clientWidgets.add(clientwidget);
                            }
                          }


                          return Expanded(
                            child: ListView(
                              children: clientWidgets,
                            ),
                          );
                        }),

                  ],

                ),


                ),
                SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20),
                      color: Colors.teal
                  ),
                  width: 180,height: 280,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment:   CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,width: 10,),
                          Text("Recently added :",style: TextStyle(color: Colors.white,fontSize: 22),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        ],
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('all').snapshots(),
                          builder:(context, snapshot) {
                            List<Row> clientWidgets=[];
                            if(snapshot.hasData){
                              final clients=snapshot.data?.docs.toList();
                              for(var client in clients!){
                                final clientwidget=Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 150,
                                        height: 110,
                                        margin: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                            //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
                                            image:NetworkImage(client['image']),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 120,
                                                height:30,
                                                margin: const EdgeInsets.all(12),
                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(6)),
                                                child: Text(
                                                  client['title'],
                                                  style: TextStyle(fontSize:12,fontWeight: FontWeight.w600, color: Colors.teal),
                                                ),
                                              ),
                                              Container(
                                                width: 120,
                                                height:30,
                                                margin: const EdgeInsets.all(12),
                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(6)),
                                                child: Text(
                                                  "EP-NO."+client['number'],
                                                  style:TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ) )
                                  ],
                                );
                                clientWidgets.add(clientwidget);
                              }
                            }


                            return Expanded(
                              child: ListView(
                                children: clientWidgets,
                              ),
                            );
                          }),

                    ],

                  ),


                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

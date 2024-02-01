import 'package:elearning/MainScreens/Contant_pages/Contant_Screen.dart';
import 'package:elearning/MainScreens/Episode_description/Episode_description_Screen.dart';
import 'package:elearning/MainScreens/PDF_reader/Pdf_viewer_page.dart';
import 'package:elearning/MainScreens/TextToSpeech/TextToSpeech_page.dart';
import 'package:elearning/MainScreens/Translator/Translator_page.dart';
import 'package:elearning/MainScreens/Video_player/Video_player_page.dart';
import 'package:elearning/MainScreens/test2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../HomeScreen.dart';

class Episode_Screen extends StatefulWidget {
  String title;
  String number;
  String  image;
  String video;
  String Description;
  String info;
  String infoLink;

  Episode_Screen({
  super.key,
  required this.title,
 required this.number,
 required this.image,
 required this.video,
 required this.Description,
 required this.info,
 required this.infoLink

  });




  @override
  State<Episode_Screen> createState() => _Episode_ScreenState();
}

class _Episode_ScreenState extends State<Episode_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:35 ,),
          Container(
            width:500,
            height:350 ,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:NetworkImage(widget.image),
                    fit: BoxFit.cover
                )
            ),
           child: Column(children: [
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(width: 10,),
                 IconButton(onPressed: (){
                   Navigator.push(context,MaterialPageRoute(builder:
                       (contxet)=> test2()));
                 }, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.teal,size: 35,)),
                 SizedBox(width: 215,),
                 Text("Englished",style: TextStyle(color:Colors.teal,fontSize: 27,fontWeight: FontWeight.bold ),)
               ],
             ),
             SizedBox(height: 170,),
             Column(
               children: [
                 SizedBox(width: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width: 10,),
                     Text("Episode NO."+widget.number,style: TextStyle(color:Colors.teal,fontSize: 30,fontWeight: FontWeight.bold ),),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width: 10,height: 8,),
                     Text(widget.title,style: TextStyle(color:Colors.teal,fontSize: 15,fontWeight: FontWeight.bold ),),
                   ],
                 ),
                 SizedBox(height:20 ,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width: 18,),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder:
                             (contxet)=> Video_player_page(video: widget.video,)));
                       },
                       child: Container(width: 110,
                         height: 40,
                         decoration: BoxDecoration(
                           color: Colors.teal,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Column(
                           children: [
                             SizedBox(height:8 ,),
                             Row(
                               children: [
                                 SizedBox(width: 8,),
                                 Icon(CupertinoIcons.play,color: Colors.white,size: 25,),
                                 Text(" Play",style:TextStyle(color: Colors.white,fontSize: 25),),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                     SizedBox(width: 18,),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder:
                             (contxet)=> HomeScreen()));
                       },
                       child: Container(width: 110,
                         height: 40,
                         decoration: BoxDecoration(
                           color: Colors.black,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Column(
                           children: [
                             SizedBox(height:8 ,),
                             Row(
                               children: [
                                 SizedBox(width: 8,),
                                 Icon(CupertinoIcons.question_circle,color: Colors.white,size: 25,),
                                 Text(" Q/A ",style:TextStyle(color: Colors.white,fontSize: 25),),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 )
               ],
             )
           ],),
          ),
          SizedBox(height: 20,),
          Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 40,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:
                          (contxet)=>Translator_page()));
                    },
                    child: Container(width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:8 ,),
                          Row(
                            children: [
                              SizedBox(width: 15,),
                              Icon(Icons.translate,color: Colors.white,size: 40,),
                        //      Text(" Play",style:TextStyle(color: Colors.white,fontSize: 25),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 60,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:
                          (contxet)=> TextToSpeech_Page()));
                    },
                    child: Container(width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:8 ,),
                          Row(
                            children: [
                              SizedBox(width: 15,),
                              Icon(CupertinoIcons.speaker_1,color: Colors.white,size: 40,),
                              //      Text(" Play",style:TextStyle(color: Colors.white,fontSize: 25),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 60,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:
                          (contxet)=> pdf_viewer_page()));
                    },
                    child: Container(width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:8 ,),
                          Row(
                            children: [
                              SizedBox(width: 15,),
                              Icon(Icons.picture_as_pdf_outlined,color: Colors.white,size: 40,),
                              //      Text(" Play",style:TextStyle(color: Colors.white,fontSize: 25),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Text('Description :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 8,),
              Text(widget.info,style: TextStyle(fontSize: 15),),
              SizedBox(height: 28,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 70,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:
                          (contxet)=> Episode_description_Screen(description: widget.Description,infoLink: widget.infoLink,title: widget.title,)));
                    },
                    child: Container(width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:8 ,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.expand_more_outlined,color: Colors.white,size: 25,),
                              Text(" More",style:TextStyle(color: Colors.white,fontSize: 25),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 70,),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: "Coming Soon",backgroundColor: Colors.teal,textColor: Colors.white);

                    },
                    child: Container(width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:8 ,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.quiz_outlined,color: Colors.white,size: 25,),
                              Text(" Quiz",style:TextStyle(color: Colors.white,fontSize: 25),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

              )
            ],
          )

        ],),
    );
  }
}

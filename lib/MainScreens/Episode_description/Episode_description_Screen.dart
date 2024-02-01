import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class Episode_description_Screen extends StatefulWidget {
  String description;
  String infoLink;
  String title;
   Episode_description_Screen({
   required this.description,
   required this.infoLink,
     required this.title
}) ;

  @override
  State<Episode_description_Screen> createState() => _Episode_description_ScreenState();
}

class _Episode_description_ScreenState extends State<Episode_description_Screen> {
 late Uri _url = Uri.parse(widget.infoLink);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Icon(Icons.document_scanner_outlined),
        title: Text(widget.title!,style: TextStyle(fontSize: 25)),
        centerTitle:true,
        backgroundColor:Colors.teal,
      ) ,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text(widget.description
            ,style:TextStyle(color: Colors.teal,fontSize: 20),),
            SizedBox(height: 30,),
            Link( builder: (context,openlink)=>
                TextButton(onPressed:openlink, child:Text("for more ",style: TextStyle(color: Colors.white,fontSize: 18),),style: TextButton.styleFrom(backgroundColor: Colors.teal),)
                ,uri: _url,
            )
          ],
        ),
      ) ,
    );
  }
}


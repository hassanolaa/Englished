import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import '../TextToSpeech/TextToSpeech_page.dart';

class Translator_page extends StatefulWidget {
  const Translator_page({Key? key}) : super(key: key);

  @override
  State<Translator_page> createState() => _Translator_pageState();
}

class _Translator_pageState extends State<Translator_page> {
  String translated="Translation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Icon(Icons.translate),
        title: Text("Translation",style: TextStyle(fontSize: 25)),
        centerTitle:true,
        backgroundColor:Colors.teal,

      ) ,
      body: Card(
        margin: EdgeInsets.all(12),
        child: ListView(padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Text('English (US)',style: TextStyle(fontSize: 17),),
              SizedBox(width: 200,),
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> TextToSpeech_Page()));
              }, icon: Icon(Icons.headset_mic))
            ],
          ),
          SizedBox(height: 8,),
          TextField(
            style: TextStyle(
              fontSize: 36,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Text',
            ),
            onChanged: (text) async{
             final translation =await text.translate(
                from: 'en',
                to: 'ar'
              );
              setState(() {
                translated=translation.text;
              });
            },
          ),
          Divider(height: 32,),
          Text('Arabic (Egypt)',style: TextStyle(fontSize: 17),),
          SizedBox(height: 8,),
          Text(translated,
          style: TextStyle(fontSize: 36,color: Colors.teal),


          )

        ],
        ),
      ),
    );
  }
}

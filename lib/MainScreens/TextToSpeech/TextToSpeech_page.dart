import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech_Page extends StatefulWidget {
  const TextToSpeech_Page({Key? key}) : super(key: key);

  @override
  State<TextToSpeech_Page> createState() => _TextToSpeech_PageState();
}

class _TextToSpeech_PageState extends State<TextToSpeech_Page> {
  final FlutterTts flutterTts=FlutterTts();
  final TextEditingController textEditingController=TextEditingController();


speak(String text) async{
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1.5);
  await flutterTts.speak(text);
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.speaker_1),
        title: Text("Text To Speech ",style: TextStyle(fontSize: 25)),
        centerTitle:true,
        backgroundColor:Colors.teal,
      ),
      body: Center(child:
        Container(alignment:
          Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min ,
            children:<Widget>[
              Text('Enter your text',style: TextStyle(color: Colors.teal,fontSize: 30,fontWeight: FontWeight.bold),),
              TextFormField(
                controller: textEditingController,
              ),
              SizedBox(height: 12,),
              ElevatedButton(onPressed: ()=>speak(textEditingController.text)
                  , child: Text('speech'),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
             SizedBox(height: 70,),
              Text("in case it doesn't work please download google services for text-to-speech from your store "
              ,style: TextStyle(color: Colors.teal,fontSize: 20),
              )
            ],
          ),
        ),
        )
        ,),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);


  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  launchURL(String Url) async{
    if(await canLaunch(Url)){
      await launch(Url);}
    else{
      print("fuck");
      throw "could not launch $Url";
    }
  }
  final websiteUri=Uri.parse('https://www.google.com/');
  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Row(children: [
                Text("Have a problem ? ",style: TextStyle(color: Colors.teal,fontSize: 20),),
                SizedBox(width: 1,),
              Link(uri:_url,
                  builder: (context,openLink)=>TextButton(onPressed: openLink, child:Text("Contact Us",style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(backgroundColor: Colors.teal),))
              ],),
            SizedBox(height: 30,),
            Container(
              width: 350,
              height: 100,
              color: Colors.teal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,width: 10,),
                  Text(" How to Use the application :",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 350,
              height: 100,
              color: Colors.teal,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,width: 10,),
                  Text(" How to Use the application :",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 350,
              height: 100,
              color: Colors.teal,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,width: 10,),
                  Text(" How to Use the application :",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 350,
              height: 100,
              color: Colors.teal,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,width: 10,),
                  Text(" How to Use the application :",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 10,)


          ],),
        ],
      ),
    );
  }
}

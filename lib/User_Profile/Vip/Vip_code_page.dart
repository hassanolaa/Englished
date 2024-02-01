import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vip_code extends StatefulWidget {
  const Vip_code({Key? key}) : super(key: key);

  @override
  State<Vip_code> createState() => _Vip_codeState();
}

class _Vip_codeState extends State<Vip_code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
    body: Column(children: [
      SizedBox(height: 70,),
      Center(
        child: Image.asset("images/cat-lady.png",scale: 6,),
      ),
      SizedBox(height: 30,),

      Text("Enter the code ",style: TextStyle(fontSize:25,color: Colors.teal ),),
      SizedBox(height: 30,),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "VIP Code",
             ),

      ),
      SizedBox(height: 70,),
      TextButton(onPressed: (){}, child: Text('GO',style: TextStyle(color: Colors.white70,fontSize: 20),),style: TextButton.styleFrom(backgroundColor:Colors.teal ),),
      SizedBox(height: 20,),
      Text("if you don't get the vip code pleass text your admin ",style: TextStyle(color: Colors.teal),)
    ],),
    );
  }
}

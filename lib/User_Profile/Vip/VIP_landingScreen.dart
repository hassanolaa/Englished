import 'package:elearning/User_Profile/Vip/Vip_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VIP_land extends StatefulWidget {
  const VIP_land({Key? key}) : super(key: key);

  @override
  State<VIP_land> createState() => _VIP_landState();
}

class _VIP_landState extends State<VIP_land> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
                children: <Widget>[ Body()],
              )),
        );
  }
}

class Body extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        SmallChild()
      ],),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            // <a href="https://www.freepik.com/free-photos-vectors/people">People vector created by stories - www.freepik.com</a>
            child: Image.network("assets/cat-lady.png", scale: .85),
          ),
          FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: .6,
              child: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Mingalarbar!",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat-Regular",
                              color: Color(0xFF111111)),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Say Hi to ",
                            style: TextStyle(
                                fontSize: 60, color: Color(0xFF8591B0)),
                            children: [
                              TextSpan(
                                  text: "🐱",
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black54
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 20),
                          child: Text("LET'S FLY TO MARS"),
                        ),
                        SizedBox(
                          height: 40,
                        ),

                      ])))
        ],
      ),
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "VIP Subscribe! ",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-Regular",
                    color: Color(0xFF111111)),
              ),
              RichText(
                text: TextSpan(
                  text: "be the best ",
                  style: TextStyle(fontSize: 50, color: Color(0xFF8591B0)),
                  children: [
                    TextSpan(
                        text: "💥",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black54
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 20),
                child: Text("LET'S Start your journey"),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset("images/cat-lady.png",scale:1,),
              ),
              SizedBox(
                height: 12,
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:
                        (contxet)=> Vip_code()));
                  }, child:Text("Start Now",style:TextStyle(color: Colors.white,fontSize: 20),),style: TextButton.styleFrom(backgroundColor:Colors.grey ),),
                ],
              )
            ],
          ),
        ));

  }
}

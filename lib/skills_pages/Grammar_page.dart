import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/MainScreens/Episode/Episode_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grammar_page extends StatefulWidget {
  const Grammar_page({Key? key}) : super(key: key);

  @override
  State<Grammar_page> createState() => _Grammar_pageState();
}

class _Grammar_pageState extends State<Grammar_page> {


  Widget listViewWidget(String name,String date,String image){
    return   Column(
      children: [
        SizedBox(height: 50,width: 50,),
        Container(
            width: 200,
            height: 150,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
                image:NetworkImage(image),

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
            ) ),
      ],
    );
  }
  Widget GridViewWidget(String title,String number,String image,String video,String Description,String info,String infoLink){
    return   GridView.count(
      crossAxisCount: 1,

      children:[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Episode_Screen(title: title,number: number,image: image,video: video,Description: Description,info: info,infoLink: infoLink,),));
            },
            child: Container(
                width: 300,
                height: 250,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
                    image:NetworkImage(image),
                    fit: BoxFit.fitWidth

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
                            title,
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
                          "Episode NO."+number,
                          style:TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                ) ),
          ),

                ]
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Grammar"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Grammar').snapshots(),
          builder:(context,AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.cyan,),);
            }
            else if (snapshot.connectionState==ConnectionState.active){
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ),
                  itemBuilder: (BuildContext context,int index){
                  return GridViewWidget(
                      snapshot.data!.docs[index]['title'],
                      snapshot.data!.docs[index]['number'],
                    snapshot.data!.docs[index]['image'],
                    snapshot.data!.docs[index]['video'],
                    snapshot.data!.docs[index]['Description'],
                    snapshot.data!.docs[index]['info'],
                    snapshot.data!.docs[index]['infoLink'],


                  );
                  });
            }
            return Center(child:Text('something went wrong...',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30)) ,);

          } )
      ,
    );
  }
}

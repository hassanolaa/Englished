import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  Widget listViewWidget(String name,String date,String image){
    return   Container(
        width: 150,
        height: 130,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
            image:NetworkImage(image),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
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
    return Scaffold(
      body: Container(child:
      StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('comingsoon').snapshots(),
          builder:(context,AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.cyan,),);
            }
            else if (snapshot.connectionState==ConnectionState.active){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return listViewWidget(
                    snapshot.data!.docs[index]['name'],
                    snapshot.data!.docs[index]['date'],
                    snapshot.data!.docs[index]['image'],



                  );
                },
              );
            }
            return Center(child:Text('something went wrong...',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30)) ,);

          } )


        ,),
    );
  }
}

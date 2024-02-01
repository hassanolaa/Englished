import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/MainScreens/MainHome_Screen.dart';
import 'package:elearning/skills_pages/Grammar_page.dart';
import 'package:elearning/skills_pages/Listening_page.dart';
import 'package:elearning/skills_pages/Pronunction_page.dart';
import 'package:elearning/skills_pages/Speaking_page.dart';
import 'package:elearning/skills_pages/Writing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Contant_pages/Widgets/movie_filters.dart';
import 'Contant_pages/Widgets/search_and _filter.dart';
import 'Episode/Episode_screen.dart';

class test2 extends StatefulWidget {
  int? selectedIndex;

  test2({
  super.key,
  this.selectedIndex,
  });


  @override
  State<test2> createState() => _test2State();
}

class _test2State extends State<test2> {
  final FocusNode searchFocusNode = FocusNode();

  static const List<String> moviesFilter = [
    'Grammar',
    'Listening',
    'Speaking',
    'Writing',
    'Pronunciation'
  ];


  @override
  void initState() {
    searchFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              Container(
                width: 300,
                height: 60,
                child: Consumer(
                builder: (context, value, child) => Expanded(
    child: AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    height: 56,
    decoration: BoxDecoration(
    color: Colors.teal,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
    color:Colors.white,
    width: 1,
    ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
    focusNode: searchFocusNode,
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white),
    decoration: InputDecoration(
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    hintText: 'Search',
    hintStyle:TextStyle(
    color: Colors.white,
    fontSize:20,
    fontWeight: FontWeight.w500),
    icon: Icon(CupertinoIcons.search,color: Colors.white,size: 30,),
    ),
    ),
    ),
    ),
    ),
              ),
              SizedBox(width: 10,),
              TextButton(onPressed: (){}, child: Icon(Icons.filter_list_sharp,size: 38,color: Colors.white,),style:TextButton.styleFrom(backgroundColor: Colors.teal,),)
            ],
          ),
          SizedBox(height: 30,),
          SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.selectedIndex != null) {
                    widget.selectedIndex = index;
                  }
                });
              },
              child: GestureDetector(
                onTap: (){
                  if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Grammar_page(),));
                  }
                  if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Listening_page(),));
                  }
                  if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Speaking_page(),));
                  }
                  if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Writing_page(),));
                  }
                  if(index==4){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Pronunction_page(),));
                  }


                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  margin: EdgeInsets.only(
                      right: index == 4 ? 24 : 0, left: index == 0 ? 24 : 12),
                  decoration: BoxDecoration(
                    color:Colors.teal,
                    borderRadius: BorderRadius.circular(100),
                    border: widget.selectedIndex != null
                        ? Border.all(
                        width: 2,
                        color: Colors.teal)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                    moviesFilter[index] ,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Episode_Screen(title:client['title'],number: client['number'],image: client['image'],video:client['video'],Description:client['Description'],info: client['info'],infoLink: client['linkInfo'],),));


                          }
                          ,child: Container(
                              width: 380,
                              height: 140,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
                                  image:NetworkImage(client['image']),
                                  fit: BoxFit.fill

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
                                        "Episode NO."+client['number'],
                                        style:TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                                      ),
                                    ),
                                  ],
                                ),
                              ) ),
                        )
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
    );
  }
}

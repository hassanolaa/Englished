import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/User_Profile/UserProfile_Edit_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth=FirebaseAuth.instance;

  late User signedInUser;

  String? name="";

  String? phoneNumber="";

  String? age="";

  String? groupNo="";

  String? classTime="";

  String? userimage="";
  String? id="";

  Future _getUserInfo() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          name=  snapshot.data()!["username"];
          phoneNumber=snapshot.data()!["phonenumber"];
          age=  snapshot.data()!["age"];
          groupNo=  snapshot.data()!["groupNo"];
          classTime=snapshot.data()!["ClassTime"];
          userimage=  snapshot.data()!["userImage"];
          id=snapshot.data()!["id"];

        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:
                              (contxet)=> SettingsUI()));
                        },
                        heroTag: 'follow',
                        elevation: 0,
                        label: const Text("Edit"),
                        backgroundColor: Colors.teal,
                        icon: const Icon(Icons.edit),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Fluttertoast.showToast(msg: "No history yet",textColor: Colors.teal,backgroundColor: Colors.white,fontSize: 18);
                        },
                        heroTag: 'mesage',
                        elevation: 0,
                        backgroundColor: Colors.black,
                        label: const Text("History"),
                        icon: const Icon(Icons.archive_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          Text(age!,style: TextStyle(fontSize: 24,color: Colors.teal),),
                          SizedBox(height: 9,),
                          Text("Age")
                        ],
                      ),
                      SizedBox(width: 60,),

                      Column(
                        children: [
                          Text("1",style: TextStyle(fontSize: 24,color: Colors.teal),),
                          SizedBox(height: 9,),
                          Text("Semester")
                        ],
                      ),
                      SizedBox(width: 60,),

                      Column(
                        children: [
                          Text(groupNo!,style: TextStyle(fontSize: 24,color: Colors.teal),),
                          SizedBox(height: 9,),
                          Text("GroupNo")
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Student ID :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),
                      SizedBox(width: 5,),
                      Text(id!,style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Phone :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal)),
                      SizedBox(width: 40,),
                      Text(phoneNumber!,style: TextStyle(fontSize: 20),),

                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Class Time :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal)),
                      SizedBox(width: 40,),
                      Text(classTime!,style: TextStyle(fontSize: 20),),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Age","19"),
    ProfileInfoItem("Semester", "1"),
    ProfileInfoItem("Group No", "3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
            child: Row(
              children: [
                if (_items.indexOf(item) != 0) const VerticalDivider(),
                Expanded(child: _singleItem(context, item)),
              ],
            )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item.value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Text(
        item.title,
        style: Theme.of(context).textTheme.caption,
      )
    ],
  );
}

class ProfileInfoItem {
  final String title;
  final String value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatefulWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  State<_TopPortion> createState() => _TopPortionState();
}

class _TopPortionState extends State<_TopPortion> {
  final _auth=FirebaseAuth.instance;

  late User signedInUser;


  String? userimage="";

  Future _getUserInfo() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {

          userimage=  snapshot.data()!["userImage"];


        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.teal,Colors.tealAccent]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userimage!)
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.teal, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
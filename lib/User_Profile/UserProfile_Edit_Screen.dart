import 'package:elearning/User_Profile/UserProfile_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/HomeScreen.dart';
import 'package:elearning/User_Profile/UserProfile_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  void _showImageDialog(){
    showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            backgroundColor:Colors.black45 ,
            title: Text("please chosse an option",style: TextStyle(color: Colors.teal),),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){_getFromCamera();},
                  child: Row(children: [
                    Padding(padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.camera,color: Colors.teal,),
                    ),
                    SizedBox(width: 10,),
                    Text("Camera",style:TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 25),)
                  ],),
                ),
                InkWell(   onTap: (){_getFromGallery();},
                  child: Row(children: [
                    Padding(padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.image,color: Colors.teal,),
                    ),
                    SizedBox(width: 10,),
                    Text("Gallery",style:TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 25),)
                  ],),)
              ],
            ),
          );
        }
    );
  }
  void _getFromCamera()async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.pop(context);
  }
  void _getFromGallery()async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
  }

  final FirebaseAuth _auth =FirebaseAuth.instance;
  final username1=TextEditingController();
  final age=TextEditingController();
  final groupN0 =TextEditingController();
  final phoneNumber =TextEditingController();
  final classTime =TextEditingController();
  String username='';
  String phonenumber='';
  String Age='';
  String GroupNo='';
  String ClassTime='';
  File? imageFile;
  String? imageUrl;
  bool showPassword = false;
  final _auth2=FirebaseAuth.instance;

  late User signedInUser;

  String? name="";

  String? phoneNumber2="";

  String? age2="";

  String? groupNo="";

  String? classTime2="";

  String? userimage="";
  String? id="";

  Future _getUserInfo2() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          name=  snapshot.data()!["username"];
          phoneNumber2=snapshot.data()!["phonenumber"];
          age2=  snapshot.data()!["age"];
          groupNo=  snapshot.data()!["groupNo"];
          classTime2=snapshot.data()!["ClassTime"];
          userimage=  snapshot.data()!["userImage"];
          id=snapshot.data()!["id"];

        });
      }
    });
  }

  Future getUserinfo(String un,String ph,String ag,String group,String time) async{
    await FirebaseFirestore.instance.collection('usersInfo').add({
      'username':un,
      'phonenumber':ph,
      'age':ag,
      'groupNo':group,
      'ClassTime':time,

    });
    print( un+ph);
    print('hassan');
  }
  Future _updataUserName() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({'username':username1.text.trim()});
    Fluttertoast.showToast(msg: "your name was updated",backgroundColor: Colors.black);
  }
  Future _updataUserNumber() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({'phonenumber':phoneNumber.text.trim()});
    Fluttertoast.showToast(msg: "your phone number was updated",backgroundColor: Colors.black);

  }
  Future _updataUserage() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({'age':age.text.trim()});
    Fluttertoast.showToast(msg: "your age was updated",backgroundColor: Colors.black);

  }
  Future _updataUserGroup() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({'groupNo':groupN0.text.trim()});
    Fluttertoast.showToast(msg: "your group number was updated",backgroundColor: Colors.black);

  }
  Future _updataUserClass() async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({'ClassTime':classTime.text.trim()});
    Fluttertoast.showToast(msg: "your group number was updated",backgroundColor: Colors.black);

  }
  Future _updataUserImage() async {
    _showImageDialog();
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({'userImage':imageUrl});
    Fluttertoast.showToast(msg: "your age was updated",backgroundColor: Colors.black);

  }

  @override
  void dispose(){
    username1.dispose();
    phoneNumber.dispose();
    age.dispose();
    groupN0.dispose();
    classTime.dispose();
    super.dispose();
  }
  void initState() {
    getUserinfo(username1.text.trim(), phoneNumber.text.trim(), age.text.trim(),groupN0.text.trim(),classTime.text.trim());
    _getUserInfo2();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder:
                (contxet)=> ProfilePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save_outlined,
              color: Colors.teal,
            ),
            onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> ProfilePage()));



            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: (){_showImageDialog();}
                      ,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
              userimage!,
                                ))),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.teal,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", name!, false,username1,username),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    setState(() {
                      _updataUserName();
                    });
                  }, child: Text("save",style: TextStyle(color: Colors.white),)),
              buildTextField("Age", age2!, false,age,Age),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    setState(() {
                      _updataUserage();
                    });
                  }, child: Text("save",style: TextStyle(color: Colors.white),)),
              buildTextField("Phone No.",phoneNumber2!, true,phoneNumber,phonenumber),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    setState(() {
                      _updataUserNumber();
                    });
                  }, child: Text("save",style: TextStyle(color: Colors.white),)),
              buildTextField("Class Time", classTime2!, false,classTime,ClassTime),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    setState(() {
                      _updataUserClass();
                    });
                  }, child: Text("save",style: TextStyle(color: Colors.white),)),
              buildTextField("Group No.", groupNo!, false,groupN0,GroupNo),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    setState(() {
                      _updataUserGroup();
                    });
                  }, child: Text("save",style: TextStyle(color: Colors.white),)),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /////
                  /////
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField,final textEditingController,String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: textEditingController,
        onChanged: (value){
          info=value ;
        },
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
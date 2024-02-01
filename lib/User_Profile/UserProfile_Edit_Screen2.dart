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
      home: EditProfilePage2(),
    );
  }
}

class EditProfilePage2 extends StatefulWidget {
  @override
  _EditProfilePageState2 createState() => _EditProfilePageState2();
}

class _EditProfilePageState2 extends State<EditProfilePage2> {

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
            onPressed: () async{
             // if(imageFile==null){
             //   Fluttertoast.showToast(msg: "please upload a image",textColor: Colors.cyanAccent,backgroundColor: Colors.black45,fontSize: 18);
             //   return;
            //  }
              try{
             //   final ref=FirebaseStorage.instance.ref().child('userImages').child(DateTime.now().toString());
             //   await ref.putFile(imageFile!);
             //   imageUrl=await ref.getDownloadURL();
                final User? user= _auth.currentUser;
                final _uid=user!.uid;
                FirebaseFirestore.instance.collection('users').doc(_uid).set({
                  'id':_uid,
                  'userImage':imageUrl,
                  'username':username1.text.trim(),
                  'phonenumber':phoneNumber.text.trim(),
                  'age':age.text.trim(),
                  'groupNo':groupN0.text.trim(),
                  'ClassTime':classTime.text.trim(),
                  'userImage':"https://i.imgur.com/BG4U1zh.jpg"

                });
                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> HomeScreen()));
              }catch(error){
                Fluttertoast.showToast(msg: error.toString());
              }


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
                                  "https://i.imgur.com/BG4U1zh.jpg",
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
              buildTextField("Full Name", "Dor Alex", false,username1,username),
              buildTextField("Age", "19", false,age,Age),
              buildTextField("Phone No.", "1234567890", true,phoneNumber,phonenumber),
              buildTextField("Class Time", "sat-3 PM", false,classTime,ClassTime),
              buildTextField("Group No.", "3", false,groupN0,GroupNo),
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
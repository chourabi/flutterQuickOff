import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Map<String, dynamic> _user  = null;

  _getUserInfo(){
    String id = _auth.currentUser.uid;


    _db.collection("users").doc(id).get().then((res){
      Map<String, dynamic> userDATA  =  res.data();


      setState(() {
        _user = userDATA;
      });
 
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
      drawer: Drawer(
        child: Column(
          children: [

            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(_user == null ? 'please wait...': _user['fullname']),
                Text(_user == null ? 'please wait...': _user['email'])
              ],),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("home page"),
      ),
    );
  }
}
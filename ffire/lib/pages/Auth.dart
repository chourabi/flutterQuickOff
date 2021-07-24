import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffire/pages/Home.dart';
import 'package:ffire/pages/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _fullname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  
  FirebaseAuth _auth = FirebaseAuth.instance;
 
  String _errorMessage= '';

  bool _isConnected = false;

  _checkAuth(){
    
    if (_auth.currentUser != null) {
      // home 
      setState(() {
        _isConnected = true;
      });

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ! _isConnected ?
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             
            Container(
              padding: EdgeInsets.all(15),
              child:  TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: "Email",

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child:  TextField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              child:  RaisedButton(
                color: Colors.amberAccent,
                onPressed: (){
                  
                  String email = _email.text;
                  String password = _password.text;

                   _auth.signInWithEmailAndPassword(email: email, password: password).then((res) {
                     Navigator.push(context, new MaterialPageRoute(builder: (context) {
                        return HomePage();
                      },));
                   }).catchError((e){
                                         setState(() {
                      _errorMessage = e.message;
                    });
                   });


                },
                child: Text("Authenticate"),

                
              ),


            ),

            _errorMessage != '' ?
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width-30,
              decoration: BoxDecoration(
                color: Colors.redAccent

              ),
              child: Text(_errorMessage,style: TextStyle(color: Colors.white),),
            ):
            Container(),

            Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) {
                        return SignupPage();
                      },));
                },
                child: Text("if you dont't have an account create one now !"),
              ),
            )
            
            

          ],),
        ):

        Center(
          child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Welcome back !! ${_auth.currentUser.email} "),
            FlatButton(
              onPressed: (){
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) {
                        return HomePage();
                      },));
              },
              child: Text("Go ! "),
            )
          ],),
        ),
        )
    );
  }
}
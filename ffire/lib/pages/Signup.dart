import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffire/pages/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController _fullname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  String _errorMessage= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Container(
              padding: EdgeInsets.all(15),
              child:  TextField(
                controller: _fullname,
                decoration: InputDecoration(
                  hintText: "Fullname"
                ),
              ),
            ),
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
                  // we need to create an account !!
                  String fullname = _fullname.text;
                  String email = _email.text;
                  String password = _password.text;

                  _auth.createUserWithEmailAndPassword(email: email, password: password).then((res){
                    print(res.user.uid);

                    // image for the user in the firestore
                    
                    _db.collection('users').doc(res.user.uid).set({
                      'fullname':fullname,
                      'email':email
                    }).then((value){
                      // sign in page
                      Navigator.push(context, new MaterialPageRoute(builder: (context) {
                        return SignInPage();
                      },));
                    });

                  }).catchError((e){ 
                    setState(() {
                      _errorMessage = e.message;
                    });
                  });
                  


                },
                child: Text("Create account"),

                
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
            Container()
            
            

          ],),
        )
    );
  }
}
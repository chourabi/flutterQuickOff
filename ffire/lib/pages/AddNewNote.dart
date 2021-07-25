import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  final dynamic refresh;
  AddNewNote({Key key, this.refresh}) : super(key: key);

  @override
  _AddNewNoteState createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {

  TextEditingController _title = new TextEditingController();
  TextEditingController _content = new TextEditingController();
  
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  String _resMessage='';
  Color _resColor= Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new note"),
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                hintText: "Note title"
              ),
            ),
            TextField(
              minLines: 5,
              maxLines: 5,
              controller: _content,
              decoration: InputDecoration(
                hintText: "Note content"
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
              
              color: Colors.amberAccent,
              onPressed: (){
                _db.collection("notes").add({
                  "title":_title.text,
                  "content":_content.text,
                  "date":new DateTime.now(),
                  "creator_id": _auth.currentUser.uid
                }).then((value){
                    setState(() {
                      _resColor=Colors.greenAccent;
                    _resMessage='Note Saved successully !';
                    });

                    widget.refresh();
                }).catchError((e){
                  setState(() {
                    _resColor=Colors.redAccent;
                    _resMessage='Something went wrong, please try again';
                  });
                });
              },
              child: Text("Save note"),
            ),
            ),


            Container(
              padding: EdgeInsets.all(15),
              color: _resColor,
              width: MediaQuery.of(context).size.width,
              child: Text(_resMessage),
            )



            
          ],
        ),
      ),

    );
  }
}
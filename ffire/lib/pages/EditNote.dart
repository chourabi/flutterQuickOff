import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditOldNote extends StatefulWidget {
  final dynamic refresh;
  final String id;
  
  EditOldNote({Key key, this.refresh, this.id}) : super(key: key);

  @override
  _EditOldNoteState createState() => _EditOldNoteState();
}

class _EditOldNoteState extends State<EditOldNote> {

  TextEditingController _title = new TextEditingController();
  TextEditingController _content = new TextEditingController();
  
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  String _resMessage='';
  Color _resColor= Colors.white;

  DocumentSnapshot _data = null;

  String _id ;

  _getNoteData(){
    _db.collection("notes").doc(_id).get().then((res) {
      setState(() {
        _data = res;
      });

      _title.text = _data.data()['title'];
      _content.text = _data.data()['content'];
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget.id;
    _getNoteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit note"),
      ),

      body: _data == null ? Center(
        child: CircularProgressIndicator(),
      )
      :
      Container(
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
                _db.collection("notes").doc(_id).update({
                  "title":_title.text,
                  "content":_content.text,
                  "date":new DateTime.now(), 
                }).then((value){
                    setState(() {
                      _resColor=Colors.greenAccent;
                    _resMessage='Note updated successully !';
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
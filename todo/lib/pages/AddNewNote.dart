import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NoteAddPage extends StatefulWidget {
  NoteAddPage({Key key}) : super(key: key);

  @override
  _NoteAddPageState createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Note'),),

      body: Container(
        child: SingleChildScrollView( 
          child: Column(
            
            children: [
               Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _title,
                  decoration: InputDecoration(
                    hintText: 'Note Title'
                  ),
                ),
              ),
               Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  maxLines: 5,
                  controller: _description,
                  decoration: InputDecoration(
                    hintText: 'Note Title'
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child:  RaisedButton(
                  onPressed: () async {
                    // call db 
                    //inset

                    var db = await openDatabase('my_db.db');
                    // before insert

                    // check if TABLE notes exist or not !!!

                    await db.execute('CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT, description TEXT )');

                    // insert
                    await db.insert('notes', {
                      'title':_title.text,
                      'description':_description.text
                    }).then((value) {
                      Navigator.pop(context);
                    });

                    
                  },
                  child: Text('Add Note'),
                )
              ),
              
            ],
          ),
        ), 
      ),
    );
  }
}
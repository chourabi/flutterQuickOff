import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffire/pages/AddNewNote.dart';
import 'package:ffire/pages/EditNote.dart';
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

  Map<String, dynamic> _user = null;

  List<QueryDocumentSnapshot> _notes = new List();

  _getUserInfo() {
    String id = _auth.currentUser.uid;

    _db.collection("users").doc(id).get().then((res) {
      Map<String, dynamic> userDATA = res.data();

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
    _getUserNotes();
  }

  _getUserNotes() {
    _db
        .collection("notes")
        .where('creator_id', isEqualTo: _auth.currentUser.uid)
        .get()
        .then((res) {
      List<QueryDocumentSnapshot> notes = new List();

      res.docs.forEach((noteDoc) {

        notes.add(noteDoc);
      });

      setState(() {
        _notes = notes;
      });
    }).catchError((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(
              builder: (context) {
                return AddNewNote(refresh: _getUserNotes);
              },
            ));
          },
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.amberAccent),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          _user == null ? 'please wait...' : _user['fullname']),
                      Text(_user == null ? 'please wait...' : _user['email'])
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // get data
            _getUserNotes();
          },
          child: ListView.builder(
            itemCount: _notes.length,
            itemBuilder: (context, index) {
              return (Container(
                  margin: EdgeInsets.all(10),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _notes[index].data()['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Text(
                          _notes[index].data()['content'],
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                        Text(_notes[index].data()['date'].toDate().toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlatButton(
                              onPressed: () {
                                _db.collection("notes").doc(_notes[index].id).delete().then((value) => _getUserNotes());                              
                                },
                              color: Colors.redAccent,
                              child: Text('delete'),
                            ),
                            FlatButton(
                              onPressed: () {
                                 String id = _notes[index].id;

                                 Navigator.push(context, new MaterialPageRoute(builder: (context) {
                                   return EditOldNote(refresh: _getUserNotes, id: id,);
                                 },));

                                },
                              color: Colors.blueAccent,
                              child: Text('edit'),
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  ))));
            },
          ),
        ));
  }
}

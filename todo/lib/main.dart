import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/pages/AddNewNote.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key   }) : super(key: key);

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<Map> _notes = [];


  _getNotes() async{
    var db = await openDatabase('my_db.db');
    List<Map> list = await db.rawQuery('SELECT * FROM notes');

    setState(() {
      _notes = list;
    });
 
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getNotes();

  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
 
        title: Text('Notes app'),
      ),
      body: ListView.builder( itemCount: _notes.length, itemBuilder: (context, index) {
        return ListTile(
          title: Text(_notes[index]['title']),
          subtitle: Text(_notes[index]['description']),
          trailing: IconButton(
            onPressed: ()async {
               var db = await openDatabase('my_db.db');
               await db.delete('notes', where: 'id = ?', whereArgs: [_notes[index]['id']]);
               _getNotes();

            },
            icon: Icon(Icons.delete,color: Colors.redAccent,),
          ),
          
        );
      }, ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return NoteAddPage();
          },));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

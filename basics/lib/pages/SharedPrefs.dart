import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends StatefulWidget {
  SharedPrefs({Key key}) : super(key: key);

  @override
  _SharedPrefsState createState() => _SharedPrefsState();
}

class _SharedPrefsState extends State<SharedPrefs> {

  String _title = "chargement";

_saveTitle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  prefs.setString("title", 'MY app title');

  
}

_loadTitle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  String res = prefs.getString("title");

  setState(() {
    _title = res;
  });

  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Column(
            children: [

              Container(height: 100,),
              Text(_title),

              FlatButton(
            onPressed: (){
              _loadTitle();
            },
            child: Text('Load title'),
          ),
            ],
          )
        ),
    );
  }
}
import 'package:films/tabs/HomeTab.dart';
import 'package:films/tabs/SearchTab.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key }) : super(key: key);
 

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int _selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    
    List<Widget> _tabs = [
      HomeTab(),
      SearchTab()
    ];

    return Scaffold( 
      body:  _tabs.elementAt(_selectedIndex) ,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int i){
          setState(() {
            _selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search")
          ),
          
        ],
      ),  
    );
  }
}

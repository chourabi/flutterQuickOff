import 'package:basics/pages/ChatApp.dart';
import 'package:basics/pages/TodosPage.dart';
import 'package:basics/pages/converterPage.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int _selectedIndex = 0;

  List<Widget> _tabs = [
    TodosPage(),
    ConverterPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      /*appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
            setState(() {
              _selectedIndex = 0;
            });
          },
        )
      ],),*/

        body: _tabs.elementAt(_selectedIndex), 

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex ,

          onTap: (int i){
            setState(() {
                _selectedIndex = i;
            });
          },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.euro_symbol),
            title: Text('Converter')
          ),
          
        ],
      ),

    );
  }
}
import 'package:flutter/material.dart';

class ListSlider extends StatefulWidget {
  ListSlider({Key key}) : super(key: key);

  @override
  _ListSliderState createState() => _ListSliderState();
}

class _ListSliderState extends State<ListSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 20,itemBuilder: (context, index) {
        return Dismissible(
          key: Key('${index}'),
          onDismissed: (DismissDirection  d){
            
            if (d == DismissDirection.endToStart) {
              
            }
          },
          background: Container(color: Colors.amberAccent,),
          child: ListTile(title: Text('Element number $index'),),

        );
      },),
    );
  }
}
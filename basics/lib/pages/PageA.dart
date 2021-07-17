import 'package:basics/pages/PageB.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  PageOne({Key key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [

            Container(height: 100,),


            Container(
              height: 100,
              width: 100,
              child: Hero(
                tag: 'img',
                child: Image.asset('assets/images/bg.jpg'),
              ),
            ),

            FlatButton(
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return PageTwo(title: "content from page one",);
            },));
          },
          child: Text('Go to second page'),
        ),


          ],
        )
      ),



    );
  }
}
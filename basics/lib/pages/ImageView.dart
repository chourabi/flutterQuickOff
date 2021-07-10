import 'package:flutter/material.dart';

class IamgeView extends StatefulWidget {
  IamgeView({Key key}) : super(key: key);

  @override
  _IamgeViewState createState() => _IamgeViewState();
}

class _IamgeViewState extends State<IamgeView> {
  @override
  Widget build(BuildContext context) {
    double h  = MediaQuery.of(context).size.height;


    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container( 
                color: Colors.amberAccent,
                height: h,
                child: Image.asset('assets/images/bg.jpg',fit: BoxFit.cover,),
              ),
              Container(
                width: 250,
                height: 250,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
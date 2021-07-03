import 'package:flutter/material.dart';

class FeedBloc extends StatelessWidget {

  final String title;
  final String date;
  final String status;



  const FeedBloc({Key key, this.title, this.date, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
      padding: EdgeInsets.all(15),
     
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
        
        Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),

        Text(date),
        Text(status),
        
      ],)
    )
    ,
    );
  }
  
}
import 'package:flutter/material.dart';

class AdvancedFeedBloc extends StatefulWidget {
  final String title;
  final String date;
  final String status;
  final int likes;
  



  const AdvancedFeedBloc({Key key, this.title, this.date, this.status, this.likes}) : super(key: key);


  @override
  _AdvancedFeedBlocState createState() => _AdvancedFeedBlocState();
}

class _AdvancedFeedBlocState extends State<AdvancedFeedBloc> {
  String title;
   String date;
   String status;
   int likes;

   bool didLike = false;
   String txt = 'Like';


   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    title=widget.title;
    date=widget.date;
    status=widget.status;
    likes = widget.likes;
  }

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

        FlatButton(
          onPressed: (){
            
           if (didLike == true) {
             setState(() {
              likes--;
              didLike = ! didLike;
              txt='Like';
            });
           }else{
              setState(() {
              likes++;
              didLike = ! didLike;
              txt='Dislike';
            });
           }

          },
          child: Text('$likes $txt'),
        )
        
      ],)
    )
    ,
    );
  }
  
}
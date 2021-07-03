import 'package:basics/components/AdvancedFeedBloc.dart';
import 'package:basics/components/FeedBloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _title='My first flutter app';

  List<dynamic> _dataFromServer = [
    1,2,3,5,6,7
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: 
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           //mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
            AdvancedFeedBloc(likes: 20, title: 'Chourabi taher', date: '07/03/2021 11:14', status: 'Bonjour je cherche un stage urgent !! SVP', ),
            AdvancedFeedBloc(likes: 15, title: 'Chourabi taher 2 ', date: '07/03/2021 11:14', status: 'Bonjour je cherche un stage urgent !! SVP', ),
            
            

          ],
        
      ),
    );
  }
}
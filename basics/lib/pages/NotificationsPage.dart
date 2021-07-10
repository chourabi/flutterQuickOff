import 'package:basics/components/NotificationBloc.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  dynamic _list = [ 
    { 'title':'welcome to flutter','text':'this is a custom notification, from flutter !' ,'vue':false }, 
    { 'title':'welcome to flutter','text':'this is a custom notification, from flutter !' ,'vue':true }, 
    { 'title':'welcome to flutter','text':'this is a custom notification, from flutter !' ,'vue':true }, 
    
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: _list.length, itemBuilder: (context, index) {
        return NotificationBloc(text: _list[index]['text'], title: _list[index]['title'], vue:_list[index]['vue'] );
      }, )
    );
  }
}